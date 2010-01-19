class Album

  attr_accessor :title
  attr_accessor :year
  
  def initialize params
    params.each_pair do |key, value|
      self.send((key.to_s+"="), value)
    end
  end

end