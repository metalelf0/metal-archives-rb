class AlbumParser

  def initialize album_url
    @album_page_document = Nokogiri::HTML(open(album_url))
  end

  def title
    @album_page_document.xpath('/html/body/center/table[1]').text.strip
  end

end