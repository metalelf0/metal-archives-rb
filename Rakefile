require 'cucumber'
require 'cucumber/rake/task'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t| 
  t.spec_opts = ["--color --format=specdoc"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end


Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

namespace :spec do 
  desc "Run specs with RCov" 
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb'] 
    t.rcov = true 
    t.rcov_opts = ['--exclude', '\/Library\/Ruby']
  end

end