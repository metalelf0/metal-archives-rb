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
puts "BAND DATA FOR " + "#{band.name}".color(:red) + ":"

[:genre, :lyrical_themes, :origin, :formed_in, :current_label, :band_status].each do |attribute|
  print_band_attribute :red, attribute, band
end

