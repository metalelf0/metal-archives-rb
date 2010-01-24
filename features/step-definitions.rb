require 'metal-archives'

Given /^I started the app$/ do
  @band_data_retriever = BandDataRetriever.new
end

When /^I ask for "([^\"]*)" band data$/ do |band_to_search|
  @band_data_retriever.band_to_search = band_to_search
  @band_data_retriever.search
end


Then /^band data should be:$/ do |expected_table|
  band = @band_data_retriever.band
  actual_table = [ [band.name, 
                 band.genre, 
                 band.lyrical_themes, 
                 band.origin, 
                 band.formed_in,
                 band.current_label,
                 band.band_status ] ]
                 
  expected_table.diff!(actual_table)
end


Then /^it should have the following albums:$/ do |expected_table|
  actual_table = @band_data_retriever.band.albums.map {|album| [album.title, album.year.to_s, album.rating.to_s ] }
  expected_table.diff!(actual_table)
end

Then /^it should have an album with index "([^\"]*)"$/ do |index|
  @index = index.to_i
  @band_data_retriever.band.albums[@index].should_not be_nil
end

Then /^its title should be "([^\"]*)"$/ do |title|
  @band_data_retriever.band.albums[@index].title.should eql(title)
end

Then /^its year should be "([^\"]*)"$/ do |year|
  @band_data_retriever.band.albums[@index].year.should eql(year.to_i)
end

Then /^its rating should be "([^\"]*)"$/ do |rating|
  if rating == ""
    @band_data_retriever.band.albums[@index].rating.should be_nil
  else
    @band_data_retriever.band.albums[@index].rating.should eql(rating.to_i)
  end
end
