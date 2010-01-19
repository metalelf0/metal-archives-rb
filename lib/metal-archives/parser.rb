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
  
  def band_albums
    row_counter = 1
    albums = []
    while(true) do
      title = @band_page_document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[1]/a").text
      break if title == ""
      year = try_to_set_year_from(@band_page_document, row_counter)
      albums << Album.new(:title => title, :year => year)
      row_counter += 1
    end
    albums
  end
  
  private
  
  def try_to_set_year_from document, row_counter
    begin
      year = document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[2]").text.split(", ")[1].to_i
    rescue
      year = nil
    end
    year
  end
  
end