require File.join(File.dirname(__FILE__), "..","spec_helper")

describe BandDataRetriever do
  
  it "should fetch a band's data" do
    url_handler_mock = mock("url_handler")
    UrlHandler.should_receive(:new).with("Trollfest").and_return(url_handler_mock)
    url_mock = mock("url")
    url_handler_mock.should_receive(:band_url).and_return(url_mock)
    band_parser_mock = mock("band_parser")
    BandParser.should_receive(:new).with(url_mock).and_return(band_parser_mock)
    Band.should_receive(:new).with(band_parser_mock)
    
    band_data_retriever = BandDataRetriever.new "Trollfest"
    band_data_retriever.search
  end
  
end