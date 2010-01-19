class Band

  attr_accessor :name
  attr_accessor :genre
  attr_accessor :lyrical_themes
  attr_accessor :origin
  attr_accessor :formed_in
  attr_accessor :current_label
  attr_accessor :band_status

  def initialize parser
    @name           = parser.band_name
    @genre          = parser.genre
    @lyrical_themes = parser.lyrical_themes
    @origin         = parser.origin
    @formed_in      = parser.formed_in
    @current_label  = parser.current_label
    @band_status    = parser.band_status
  end

end
