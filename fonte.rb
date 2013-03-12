require 'active_support/all'
require_relative 'structs'

include Structs

module Constants
  mattr_accessor :offset_table_begin
  @@offset_table_begin = 0

  mattr_accessor :offset_table_size
  @@offset_table_size = 12

  mattr_accessor :table_records_begin
  @@table_records_begin = 13

  mattr_accessor :table_record_size
  @@table_record_size = 16 
end

class Fonte
  include Constants

  def initialize file
    @file = File.open file, "rb:ASCII-8BIT"
  end

  def offset_table
    @file.seek offset_table_begin
    chunk = @file.read offset_table_size
    OffsetTable.new *(chunk.unpack 'a4n4')
  end

  def tables 
    entries = []
    @file.seek table_records_begin 
    offset_table.tables_count.times do
      chunk = @file.read table_record_size
      entries << TableRecord.new(*(chunk.unpack 'a4N3'))
    end
    entries 
  end

  def feature_list
    seek_to_table 'GSUB'
    gsub_header = @file.read(10).unpack 'n5'
    feature_list_offset = gsub_header[3] 

    @file.seek(feature_list_offset + find_table('GSUB').offset)
    
    feature_count = @file.read(2).unpack 'n'
    acc = []
    feature_count[0].times do
      acc << @file.read(6).unpack('a4n')[0]
    end
    acc.uniq
  end

  def seek_to_table tag
    @file.seek find_table(tag).offset
  end

  def find_table tag
    tables.select { |t| t.tag == tag }.first
  end
end
