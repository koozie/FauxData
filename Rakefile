
require "rake/testtask" 
require "rake/clean"

CLEAN.include('*.gem')
CLOBBER.include(FileList['.yardoc/*','doc/*'].exclude('.gitignore'))

task :default => [:test]

Rake::TestTask.new do |test|
  test.libs << "test" 
  test.test_files = Dir[ "test/test_*.rb" ]
  test.verbose = true
end

desc "Build Gem"
task :build do
  sh "gem build faux_data.gemspec"
end