class Album

  attr_accessor :title
  attr_accessor :year
  attr_accessor :rating
  attr_accessor :release_id
  
  def initialize params
    params.each_pair do |key, value|
      self.send((key.to_s+"="), value)
    end
  end

end