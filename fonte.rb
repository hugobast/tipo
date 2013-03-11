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
    @file = File.open file
  end

  def offset_table
    @file.seek offset_table_begin
    chunk = @file.read offset_table_size
    OffsetTable.new *(chunk.unpack 'a4n4')
  end

  def tables 
    accumulator = []
    @file.seek table_records_begin 
    offset_table.tables_count.times do
      chunk = @file.read table_record_size
      accumulator << TableRecord.new(*(chunk.unpack 'a4N3'))
    end
    accumulator
  end 
end
