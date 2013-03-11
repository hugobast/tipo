require_relative '../fonte'

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
