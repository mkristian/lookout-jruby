require "lookout/jruby/version"

module Lookout
  module Jruby
    if RUBY_PLATFORM == 'java'
      require 'java'

      # JRuby cert/path hack
      require 'lookout/jruby/jruby-6970'
      require 'lookout/jruby/jruby-6970-openssl'

      # JRuby YAML hack
      require 'lookout/jruby/psych'
    end
  end
end
