# Lookout::Jruby

JRuby hacks/compatibility code for JRUBY-6970
(https://jira.codehaus.org/browse/JRUBY-6970, fix taken from the Logstash
project) and for YAML/Configatron

Note: with JRuby 1.7+, openssl is baked in, and so this gem does not depend on
jruby-openssl.  However, if you're using an older JRuby, you will need to have
jruby-openssl in your gemfile.

## Installation

Add this line to your application's Gemfile:

    gem 'lookout-jruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lookout-jruby

## Usage

require 'lookout/jruby' in your project

## Contributing

1. Fork it ( http://github.com/lookout/lookout-jruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
