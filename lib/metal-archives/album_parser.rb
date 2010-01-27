class AlbumParser

  def initialize album_url
    @album_page_document = Nokogiri::HTML(open(album_url))
  end

  def title
    @album_page_document.xpath('/html/body/center/table[1]').text.strip
  end
  
  def release_type
    @album_page_document.xpath('/html/body/center/table[2]/tbody/tr/td').text.strip.split(",")[0]
  end

end