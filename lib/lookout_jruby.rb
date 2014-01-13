require "lookout_jruby/version"

module LookoutJruby
  if RUBY_PLATFORM == 'java'
    require 'java'
    
    # JRuby cert/path hack
    require 'lookout_jruby/jruby-6970'
    require 'lookout_jruby/jruby-6970-openssl'
  
    # JRuby YAML hack
    require 'lookout_jruby/psych'
    
    # Oracle JRE 7 enables this which causes us all sorts of trouble with Keymaster
    java.lang.System.set_property('jsse.enableSNIExtension', 'false')
    # Preferring IPv4 to make sure the JVM doesn't try to open IPv6 mode TCP
    # sockets
    java.lang.System.set_property('java.net.preferIPv4Stack' , 'true')
  end
end
