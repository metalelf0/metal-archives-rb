require File.join(File.dirname(__FILE__), "..","spec_helper")

describe UrlHandler do

  it "should get the right index url for a band" do
    url_handler = UrlHandler.new("Trollfest")
    url_handler.index_url.should eql("http://www.metal-archives.com/browseL.php?l=T")
  end
  
  it "should get the right url for a band" do
    url_handler = UrlHandler.new("Trollfest")
    url_handler.should_receive(:index_url).exactly(2).times.and_return(SAMPLE_INDEX_PAGE)
    
    url_handler.band_url.start_with?("http://www.metal-archives.com/band.php?id=20648").should be_true
    
    url_handler.band = "Trollzorn"
    url_handler.band_url.start_with?("http://www.metal-archives.com/band.php?id=17023").should be_true
  end

end