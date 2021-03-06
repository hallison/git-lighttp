require 'date'

module Git

  # The objective of this class is to implement various ideas proposed by the
  # Semantic Versioning Specification (see reference[http://semver.org/]).
  module Lighttp #:nodoc:
    VERSION   = '0.3.2'
    RELEASE   = Date.today.to_s
    TIMESTAMP = '2011-07-05 12:32:36 -04:00'

    def self.info
      "#{name} v#{VERSION} (#{RELEASE})"
    end

    def self.to_h
      { :name      => name,
        :version   => VERSION,
        :semver    => VERSION.to_semver_h,
        :release   => RELEASE,
        :timestamp => TIMESTAMP }
    end

  end

end

