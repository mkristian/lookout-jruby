# this is workaround for https://github.com/jruby/jruby/issues/3306

# jruby-9k just works
if JRUBY_VERSION.start_with?("1.")
  require 'yaml'
  module YAML
    class << self
      alias :_load_file :load_file

      def load_file( filename )
        if filename.start_with?("uri:classloader:/")
          self.load(File.read(filename))
        else
          _load_file(filename)
        end
      end
    end
  end
end

begin
  # This hack is required because YAML is all kinds of messed up and incompatible
  # with our version of Configatron under JRuby
  module Psych
    module Yecht
      class MergeKey
      end
    end
  end
rescue Exception
  # just be failsafe
end
