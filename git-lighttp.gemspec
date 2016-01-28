require 'git/lighttp'

spec = Gem::Specification.new

spec.platform = Gem::Platform::RUBY
spec.name     = 'git-lighttp'
spec.summary  = 'Git Web implementation of the Light (Smart) HTTP'
spec.authors  = ['Hallison Batista']
spec.email    = 'hallisonbatista@gmail.com'
spec.homepage = 'http://github.com/hallison/git-lighttp'
spec.version  = Git::Lighttp::VERSION
spec.date     = Git::Lighttp::RELEASE
spec.licenses = ['MIT']

spec.test_files    = spec.files.select { |path| path =~ %r{^test/.*} }
spec.require_paths = ['lib']
spec.files = %x(git ls-files).split.reject do |out|
  out  =~  /([MR]ake|Gem)file/ || out =~ /^\./ ||
  out  =~  %r{^doc/api} || out =~ %r{^test/.*}
end
spec.description = <<-end
Git::Lighttp is a implementation of the several features:
- Smart HTTP which works like as git-http-backend.
- Show info pages about the projects.
end
spec.add_dependency 'sinatra', '~> 1.4'
