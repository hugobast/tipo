require_relative '../font'
require_relative '../header'

describe Header do
  context "contains the information located in the header" do
    let(:font) { Font.new 'spec/hobo.otf' }
    let(:header) { Header.new font }

    it "reads the offset table" do
      header.offset_table.version.should eq "OTTO"
    end

    it "reads the table record entries" do
      header.table_records.first.tag.should eq "BASE"
    end
  end
end
