class Parser

  attr_accessor :band_page_document

  def initialize band_url
    @band_page_document = Nokogiri::HTML(open(band_url))
  end
  
  def band_name
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[1]/td').text
  end
  
  def genre
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[3]/td').text
  end
  
  def lyrical_themes
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[5]/td').text  
  end  

  def origin
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[7]/td[1]/a').text
  end

  def formed_in
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[7]/td[2]').text
  end
  
  def current_label
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[7]/td[3]').text
  end
  
  def band_status
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[7]/td[4]').text
  end
  
end