require_relative '../fonte'

describe Fonte do
  context "sfnt directory" do
    it "reads the offset table" do
      fonte = Fonte.new 'spec/hobo.otf'
      fonte.offset_table.version.should eq "OTTO"
    end

    it "reads the table record entries" do
      fonte = Fonte.new 'spec/hobo.otf'
      fonte.tables.first.tag.should eq "BASE"
    end
  end

  context "reads simple font information" do
    it "reads the feature list" do
      fonte = Fonte.new 'spec/hobo.otf'
      fonte.feature_list.should eq ['aalt', 'frac', 'liga', 'ordn', 'sups']
    end

    it "reads the font name"

    it "reads the font style"

    it "reads the font family name"
  end
end
