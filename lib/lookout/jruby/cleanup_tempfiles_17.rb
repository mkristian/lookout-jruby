module Lookout
  module Jruby

    class << self
      def process_exists?(pid)
        system("kill -0 #{pid} 2> /dev/null")
      rescue
        # i.e. windows
        false
      end
      private :process_exists?
      
    end
  end
end
