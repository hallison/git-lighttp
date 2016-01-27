require "git/lighttp"

def spec
  @spec ||= Gem::Specification.load("git-lighttp.gemspec")
end

desc "Run tests"
task :test, [:file] do |spec, args|
  Dir["test/#{args.file}*_test.rb"].each do |file|
    sh "ruby #{file}"
  end
end

desc "API Documentation (RDoc)"
task :doc do
  sh "rdoc -o doc/api -H -f hanna -m README.rdoc"
end

desc "Build tags"
task :tags do
  rbalias = '/.*alias(_method)?[[:space:]]+:([[:alnum:]_=!?]+),?[[:space:]]+:([[:alnum:]_=!]+)/\\2/f/'
  sh "ctags", "--recurse=yes",
              "--tag-relative=yes",
              "--totals=yes",
              "--extra=+f",
              "--fields=+iaS",
              "--regex-ruby="+rbalias
end

desc "Build #{spec.file_name}"
task :build => "#{spec.name}.gemspec" do
  sh "gem build #{spec.name}.gemspec"
end

desc "Release #{spec.file_name}"
task :release => :build do
  sh "gem push #{spec.file_name}"
end

desc "Install gem file #{spec.file_name}"
task :install => :build do
  sh "gem install -l #{spec.file_name}"
end

desc "Uninstall gem #{spec.name} v#{spec.version}"
task :uninstall do
  sh "gem uninstall #{spec.name} -v #{spec.version}"
end

task :default => :test
