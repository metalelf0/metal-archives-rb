require File.join(File.dirname(__FILE__), "..","spec_helper")

describe Band do
  
  it "should build up from a parser correctly" do
    parser = Parser.new(SAMPLE_BAND_PAGE)
    trollfest = Band.new(parser)
    trollfest.name.should eql("Trollfest")
    trollfest.origin.should eql("Norway")
  end

end