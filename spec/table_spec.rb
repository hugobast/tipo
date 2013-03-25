require_relative '../font'
require_relative '../header'
require_relative '../table'

describe Table do
  let(:font) { Font.new 'spec/hobo.otf' }
  let(:header) { Header.new font }
  let(:table) { Table.new header, font }

  context "navigating" do
    it "has a name" do
      table.name = "GPOS"
      table.name.should eq "GPOS"
    end

    it "has a start position" do
      table.name = "GSUB"
      table.offset.should eq 23376
    end
  end
end
