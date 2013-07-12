
dir = File.dirname(__FILE__)
lib = File.join(dir, "lib", "faux_data.rb")
require 'date'

Gem::Specification.new do |gem|
  gem.name    = 'faux_data'
  #gem.version = '1.0.0'
  gem.version = File.read(lib)[/^\s*VERSION\s*=\s*(['"])(\d\.\d\.\d)\1/, 2]
  gem.date    = Date.today.to_s
  
  gem.summary = "FauxData is a ruby library that creates faux employee, member or people data"
  gem.description = "FauxData was created to quickly generate random employee demographic data which is used for demostrating your application and application's reporting features.  Address data is pulled from US Census records, keeping the US city, US state, and US zip code in sync, while street names are randomly pulled."

  gem.authors  = ['Chris Stansbury']
  gem.email    = 'Chris@koozie.org'
  gem.homepage = 'https://github.com/koozie/FauxData'
  
  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] #& `git ls-files -z`.split("\0")
  gem.licenses = ['GPL-2', 'Ruby Software License']
end
