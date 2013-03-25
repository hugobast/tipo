require 'tipo'

include Tipo
include Table

describe Base do
  let(:font) { Font.new 'spec/fixtures/hobo.otf' }
  let(:header) { Header.new font }
  let(:table) { Base.new header, font }

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
