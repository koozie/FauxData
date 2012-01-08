
require "rubygems" 
require "rake" 
require "rake/testtask" 
require "rake/clean"

#CLEAN.include('build/*.txt', 'SRA_*.*','texput.log')   #remove generated files from process
#CLEAN.include(FileList['build/*'].exclude('.gitignore'))   #remove generated files from process
#CLOBBER.include(FileList['data/*'].exclude('.gitignore'))     #remove ER source files
CLEAN.include('*.gem')
CLOBBER.include(FileList['.yardoc/*','doc/*'].exclude('.gitignore'))

task :default => [:test]

Rake::TestTask.new do |test|
  test.libs << "test" 
  test.test_files = Dir[ "test/test_*.rb" ]
  test.verbose = true
end
