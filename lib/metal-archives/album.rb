class Album

  attr_accessor :title
  attr_accessor :release_type
  attr_accessor :year
  attr_accessor :rating
  attr_accessor :release_id
  attr_accessor :tracklist
  
  def initialize params={}
    params.each_pair do |key, value|
      self.send((key.to_s+"="), value)
    end
  end

  def build_from parser
    @parser = parser
    @title = parser.title
    @release_type = parser.release_type
    self
  end

end