# Workaround for JRUBY-6970 (https://jira.codehaus.org/browse/JRUBY-6970)
# taken from the Logstash project, see:
# <https://github.com/logstash/logstash/blob/master/lib/logstash/JRUBY-6970-openssl.rb>
class OpenSSL::SSL::SSLContext
  alias_method :ca_path_JRUBY_6970=, :ca_path=
  alias_method :ca_file_JRUBY_6970=, :ca_file=

  def ca_file=(arg)
    if arg =~ /^jar:file:\//
      return ca_file_JRUBY_6970=(arg.gsub(/^jar:/, ""))
    end
    return ca_file_JRUBY_6970=(arg)
  end

  def ca_path=(arg)
    if arg =~ /^jar:file:\//
      return ca_path_JRUBY_6970=(arg.gsub(/^jar:/, ""))
    end
    return ca_path_JRUBY_6970=(arg)
  end
end
