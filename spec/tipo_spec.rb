require 'tipo'

include Tipo

describe Info do
  it "takes a file" do
    info = Info.new 'spec/fixtures/hobo.otf'
    info.font.class.should eq Font
  end

  it "return a naming table" do
    info = Info.new 'spec/fixtures/hobo.otf'
    info.naming.class.should eq Table::Naming
    info.substitution.class.should eq Table::Substitution
  end
end
