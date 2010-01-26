module ConsoleUtils

  def pad_to string, size
    return string[0..size - 1] if string.size > size
    spaces = size - string.size
    return string + " "*spaces
  end

  def humanize attribute
    attribute_name = attribute.to_s.capitalize.gsub("_", " ")
    pad_to(attribute_name, 20)
  end
  
  def print_attribute_in_color object, attribute, color
    puts "#{humanize(attribute)}> " +  "#{object.send(attribute)}".color(color)
  end
  
end