class BandDataRetriever

  attr_accessor :band_to_search
  attr_accessor :band
  
  def initialize band_to_search=""
    @band_to_search = band_to_search
  end
  
  def search
    band_url = UrlHandler.new(@band_to_search).band_url
    parser = Parser.new(band_url)
    @band = Band.new(parser)
  end
  
end