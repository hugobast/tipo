require 'font'

describe Font do
  let(:font) { Font.new 'spec/hobo.otf' }
  it "reads a file as ascii-8bit" do
    font.encoding.should eq Encoding::ASCII_8BIT
  end

  it "delegates seek and tell to the file" do
    font.seek 3
    font.tell.should eq 3
  end

  it "gets a chunk of data" do
    font.chunk(bytes: 4).should eq "OTTO"
  end

  it "gets chunks in sucessions" do
    font.chunk(bytes: 2).should eq "OT"
    font.chunk(bytes: 2).should eq "TO"
  end

  it "can unpack a chunk with a template" do
    font.unpack(seek: 0, bytes: 12, tmpl: 'a4n4').should eq ["OTTO", 13, 128, 3, 80]
  end
end
