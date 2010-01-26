class BandParser

  attr_accessor :band_page_document

  def initialize band_url
    @band_page_document = Nokogiri::HTML(open(band_url))
  end
  
  def band_name
    @band_page_document.xpath('/html/body/center/table[1]/tr/td[1]/table/tr[1]/td').text
  end
  
  def genre
    fetch_text_under /Genre/
  end
  
  def lyrical_themes
    fetch_text_under /Lyrical theme/
  end  

  def origin
    fetch_link_under /Origin/
  end

  def formed_in
    fetch_text_under /Formed in/
  end
  
  def current_label
    fetch_text_under /Current label/
  end
  
  def band_status
    fetch_text_under /Status/
  end
  
  def band_albums
    row_counter = 1
    albums = []
    while(true) do
      title = @band_page_document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[1]/a").text
      break if title == ""
      year = try_to_set_year_from(@band_page_document, row_counter)
      rating = try_to_set_rating_from(@band_page_document, row_counter)
      release_id = try_to_set_release_id_from(@band_page_document, row_counter)
      albums << Album.new(:title => title, :year => year, :rating => rating, :release_id => release_id)
      row_counter += 1
    end
    albums
  end
  
  private
  
  def fetch_text_under regexp
    begin
      node_with_header = @band_page_document.xpath('//td').select { |node| node.text =~ regexp }[1]
      index_of_node =    node_with_header.parent.children.index(node_with_header)
      return node_with_header.parent.next_sibling.children[index_of_node].text.strip
    rescue
      return ""
    end
  end

  def fetch_link_under regexp
    begin
      node_with_header = @band_page_document.xpath('//td').select { |node| node.text =~ regexp }[1]
      index_of_node =    node_with_header.parent.children.index(node_with_header)
      return node_with_header.parent.next_sibling.children[index_of_node].children.select { |node| node.name == "a" }[0].text.strip
    rescue
      return ""
    end
  end
  
  
  
  def try_to_set_year_from document, row_counter
    begin
      year = document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[2]").text.split(", ")[1].to_i
    rescue
      year = nil
    end
    year
  end
  
  def try_to_set_rating_from document, row_counter
    begin
      rating = document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[4]").text.split("%")[0].split(" ")[-1].to_i
    rescue
      rating = nil
    end
    rating
  end

  def try_to_set_release_id_from document, row_counter
    begin
      release_id = document.xpath("/html/body/center/table[3]/tr[#{row_counter}]/td[1]/a/@href").text.split("?id=")[1].to_i
    rescue
      release_id = nil
    end
    release_id
  end
  
end