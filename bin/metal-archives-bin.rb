#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__),"..","lib") 
require 'rubygems'
require 'rainbow'
require 'metal-archives'
require 'console-utils'
include ConsoleUtils

print "Band name     > "
band_name = gets()

band = BandDataRetriever.new(band_name).search
puts "\n#{band.name} band data:".color(:black).background(:white)

[:genre, :lyrical_themes, :origin, :formed_in, :current_label, :band_status].each do |attribute|
  print_attribute_in_color band, attribute, :red 
end

puts "\nDiscography:".color(:black).background(:white)

band.albums.sort { |a1, a2| a1.year <=> a2.year }.each do |album|
  [:year, :title, :rating].each do |attribute|
    print_attribute_in_color album, attribute, :blue
  end
  puts
end
