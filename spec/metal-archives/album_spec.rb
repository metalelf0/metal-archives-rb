require File.join(File.dirname(__FILE__), "..","spec_helper")

describe Album do

  it "should build up from a parser correctly" do
    parser = AlbumParser.new(SAMPLE_ALBUM_PAGE)
    willkommen = Album.new.build_from(parser)
    willkommen.title.should eql("Trollfest - Willkommen Folk Tell Drekka Fest!")
    willkommen.release_type.should eql("Full-length")
  end
  
end