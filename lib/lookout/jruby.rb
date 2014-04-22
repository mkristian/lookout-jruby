require "lookout/jruby/version"

module Lookout
  module Jruby
    if RUBY_PLATFORM == 'java'
      require 'java'

      # If we can require jruby-openssl - because it's available in the bundle -
      # do so.  If not, JRuby should have openssl baked in, as of 1.7.
      begin
        require 'jruby-openssl'
      rescue LoadError => e
        require 'openssl'
      end

      # JRuby cert/path hack
      require 'lookout/jruby/jruby-6970'
      require 'lookout/jruby/jruby-6970-openssl'

      # JRuby YAML hack
      require 'lookout/jruby/psych'
    end
  end
end
