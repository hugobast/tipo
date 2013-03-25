require 'tipo'

include Tipo
include Table

describe Substitution do
  let(:font) { Font.new 'spec/fixtures/hobo.otf' }
  let(:header) { Header.new font }
  let(:gsub) { Substitution.new header, font }

  context "information" do
    it "has a header" do
      gsub.header.version.should eq "1.0" 
    end

    it "has a feature list count" do
      gsub.feature_list_count.should eq 10
    end

    it "has a list of features" do
      gsub.feature_list.map do |feature|
        feature.tag 
      end.uniq.should eq ["aalt", "frac", "liga", "ordn", "sups"]
    end
  end
end
