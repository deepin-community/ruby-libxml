require 'gem2deb/rake/testtask'

Gem2Deb::Rake::TestTask.new do |t|
  t.libs = ['test']
  t.verbose = true
  t.test_files = FileList['test/test_suite.rb']
end
