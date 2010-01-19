require File.join(File.dirname(__FILE__), "..","spec_helper")

describe Band do
  
  it "should build up from a parser correctly" do
    parser = Parser.new(SAMPLE_BAND_PAGE)
    trollfest = Band.new(parser)
    trollfest.name.should eql("Trollfest")
    trollfest.origin.should eql("Norway")
  end
  
  it "should also get its discography from the parser" do
    parser = Parser.new(SAMPLE_BAND_PAGE)
    trollfest = Band.new(parser)
    trollfest.albums[0].title.should eql("Promo")
    trollfest.albums[1].title.should eql("Willkommen Folk Tell Drekka Fest!")
  end


end