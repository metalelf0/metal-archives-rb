require File.join(File.dirname(__FILE__), "..","spec_helper")

describe Parser do

  before(:all) do
    # url_handler = UrlHandler.new("Trollfest")
    # trollfest_page = url_handler.band_url
    # @parser = Parser.new(trollfest_page)
    @parser = Parser.new(SAMPLE_BAND_PAGE)
    @parser2 = Parser.new(SAMPLE_DIFFICULT_BAND_PAGE)
  end

  it "should get band name from its page" do
    @parser.band_name.should eql("Trollfest")
    @parser2.band_name.should eql("Troll Gnet El")
  end
  
  it "should get genre from its page" do
    @parser.genre.should eql("Folk Metal")
    @parser2.genre.should eql("Folk Metal")
  end
  
  it "should get lyrical themes from its page" do
    @parser.lyrical_themes.should eql("Trolls, Drinking")
    @parser2.lyrical_themes.should eql("")
  end
  
  it "should get origin from its page" do
    @parser.origin.should eql("Norway")
    @parser2.origin.should eql("Russia")
  end
  
  it "should get formed-in year from its page" do
    @parser.formed_in.should eql("2003")
    @parser2.formed_in.should eql("2002")
    
  end
  
  it "should get current label from its page" do
    @parser.current_label.should eql("Twilight Vertrieb")
    @parser2.current_label.should eql("Unsigned")
  end
  
  it "should get its status from its page" do
    @parser.band_status.should eql("Active")
    @parser2.band_status.should eql("Active")
  end
  
  it "should get band discography from its page" do
    @parser.band_albums[0].title.should eql("Promo")
    @parser.band_albums[0].year.should eql(2004)
    @parser.band_albums[0].rating.should eql(53)  
    @parser.band_albums[0].release_id.should eql(49300)  
  end
  
end