require 'active_support/all'

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

OffsetTable = Struct.new(
  :version, :tables_count, :search_range, :entry_selector, :range_shift
)

TableRecord = Struct.new(
  :tag, :checksum, :offset, :length
)

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

# table entry format would be 'a4N3'

describe Fonte do
  context "sfnt directory" do
    it "reads the offset table" do
      fonte = Fonte.new 'spec/hobo.otf'
      fonte.offset_table.version.should eq "OTTO"
    end

    it "reads the table tables" do
      fonte = Fonte.new 'spec/hobo.otf'
      fonte.tables.first.tag.should eq "BASE"
    end
  end
end
