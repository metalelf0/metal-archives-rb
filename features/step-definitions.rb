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

