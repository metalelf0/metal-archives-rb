class BandDataRetriever

  attr_accessor :band_to_search
  attr_accessor :band
  
  def initialize band_to_search=""
    @band_to_search = band_to_search.strip
  end
  
  def search
    band_url = UrlHandler.new(@band_to_search).band_url
    parser = BandParser.new(band_url)
    @band = Band.new.build_from(parser)
  end
  
end