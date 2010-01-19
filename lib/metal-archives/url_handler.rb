require 'nokogiri'
require 'open-uri'

class UrlHandler
  
  attr_accessor :band
  
  def initialize band
    @band = band
  end
  
  def index_url
    return "http://www.metal-archives.com/browseL.php?l=" + @band[0..0]
  end
  
  def band_url
    index_document = Nokogiri::HTML(open(index_url))
    all_links = index_document.xpath('//a')
    band_node = all_links.select { |node| node.text == @band }[0]
    return "http://www.metal-archives.com/".concat(band_node.attributes["href"].value)
  end
  
end