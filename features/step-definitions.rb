require 'metal-archives'

Given /^I started the app$/ do
  @band_data_retriever = BandDataRetriever.new
end

When /^I ask for "([^\"]*)" band data$/ do |band_to_search|
  @band_data_retriever.band_to_search = band_to_search
  @band_data_retriever.search
end

Then /^band name should be "([^\"]*)"$/ do |data|
  @band_data_retriever.band.name.should eql(data)
end

Then /^it should have the following albums:$/ do |expected_table|
  actual_table = @band_data_retriever.band.albums.map {|album| [album.title, album.year.to_s, album.rating.to_s ] }
  expected_table.diff!(actual_table)
end