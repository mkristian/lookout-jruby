require "lookout/jruby/version"
require 'lookout/jruby/cleanup_tempfiles_common'

if JRUBY_VERSION.start_with?('1.')
  require 'lookout/jruby/cleanup_tempfiles_17'
else
  require 'lookout/jruby/cleanup_tempfiles_9k'
end
Lookout::Jruby.cleanup_tempfiles
