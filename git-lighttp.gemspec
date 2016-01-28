$LOAD_PATH.unshift 'lib' unless $LOAD_PATH.include? 'lib'

require 'git/lighttp'

Gem::Specification.new do |g|
  g.platform  = Gem::Platform::RUBY
  g.name      = 'git-lighttp'
  g.summary   = 'Git Web implementation of the Light (Smart) HTTP'
  g.authors   = ['Hallison Batista']
  g.email     = 'hallisonbatista@gmail.com'
  g.homepage  = 'http://github.com/hallison/git-lighttp'
  g.version   = Git::Lighttp::VERSION
  g.date      = Git::Lighttp::RELEASE
  g.licenses  = ['MIT']

  g.test_files = g.files.select do |path|
    path =~ %r{^test/.*}
  end
  g.files = %x(git ls-files).split.reject do |out|
    ignore = out =~ /([MR]ake|Gem)file/ || out =~ /^\./
    ignore = ignore || out =~ %r{^doc/api} || out =~ %r{^test/.*}
    ignore
  end
  g.description = <<-end
  Git::Lighttp is a implementation of the several features:
  - Smart HTTP which works like as git-http-backend.
  - Show info pages about the projects.
  end
  g.add_dependency 'sinatra', '~> 1.4'
  g.add_dependency 'json',    '~> 1.8'

  g.add_development_dependency 'minitest',    '~> 5.8'
  g.add_development_dependency 'minitest-rg', '~> 5.2'
  g.add_development_dependency 'rack-test',   '~> 0.6'

  g.require_paths = ['lib']
end
