require_relative '../font'
require_relative '../header'
require_relative '../naming'

describe Naming do
  let(:font) { Font.new 'spec/hobo.otf' }
  let(:header) { Header.new font }
  let(:name) { Naming.new header, font }

  context "sorta header information" do
    it "has a format" do
      name.header.format.should eq 0
    end

    it "has a count" do
      name.header.count.should eq 24
    end

    it "has a string storage offset" do
      name.header.storage_offset.should eq 294
    end
  end

  context "name records" do
    it "has a family name" do
      name.family_name.should eq "Hobo Std"
    end

    it "has a style" do
      name.style.should eq "Regular"
    end

    it "has a name" do
      name.name.should eq "Hobo Std Medium"
    end
  end
end
