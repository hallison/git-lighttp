require "git/lighttp"

Gem::Specification.new do |spec|
  spec.platform          = Gem::Platform::RUBY
  spec.name              = "git-lighttp"
  spec.summary           = "Git Web implementation of the Light (Smart) HTTP and other features"
  spec.authors           = ["Hallison Batista"]
  spec.email             = "hallisonbatista@gmail.com"
  spec.homepage          = "http://github.com/hallison/git-lighttp"
  spec.rubyforge_project = spec.name
  spec.version           = Git::Lighttp::VERSION
  spec.date              = Git::Lighttp::RELEASE
  spec.test_files        = spec.files.select{ |path| path =~ /^test\/.*/ }
  spec.require_paths     = ["lib"]
  spec.files             = %x[git ls-files].split.reject do |out|
    out =~ %r{^\.} || out =~ %r{/^doc/api/}
  end
  spec.description       = <<-end.gsub /^    /,''
    Git::Lighttp is a implementation of the several features:
    - Smart HTTP which works like as git-http-backend.
    - Show info pages about the projects.
  end
  spec.add_dependency "sinatra"
end

