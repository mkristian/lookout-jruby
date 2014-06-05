require "lookout/jruby/version"

module Lookout
  module Jruby
    if RUBY_PLATFORM == 'java'
      # JRuby YAML hack
      require 'lookout/jruby/psych'
    end
  end
end
