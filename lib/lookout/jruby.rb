require "lookout/jruby/version"

module Lookout
  module Jruby
    if RUBY_PLATFORM == 'java'
      # JRuby YAML hack
      require 'lookout/jruby/psych'

      # start a cleanup immediately
      require 'lookout/jruby/cleanup_tempfiles'
    end
  end
end
