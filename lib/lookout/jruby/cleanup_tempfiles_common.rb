module Lookout
  module Jruby

    class << self
      # cleanup the jars copied to the temp directory when it gets
      # added to the JRuby classloader. when killing jruby hard
      # then those files remain there as the JVM does not clean them
      # up.
      def cleanup_tempfiles
        Dir[File.join(ENV_JAVA['java.io.tmpdir'], 'jruby-*')].each do |dir|
          pid = File.basename(dir)[6..-1]
          unless process_exists?(pid)
            # do not use fileutils here as we are in jruby-core
            Dir[File.join(dir, '*')].each do |file|
              File.delete(file) rescue warn "could not delete #{file}"
            end
            Dir.delete(dir) rescue warn "could not delete #{dir}"
          end
        end
      end
    end
  end
end
