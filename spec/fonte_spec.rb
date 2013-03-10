class Fonte
  attr_accessor :offset_table_size
  offset_table_size = 12

  def initialize file
    @file = File.open file
  end

  def offset_table
    chunk = @file.read offset_table_size
    chunk.unpack 'a4n4'
  end
end

describe Fonte do

  context "sfnt directory" do
    it "reads the offset table" do
      fonte = Fonte.new 'hobo.otf'
      fonte.offset_table.should eq ["OTTO", 13, 128, 3, 80]
    end
  end
end
