require 'cgi'
module DocumentCloud
  module Configurable
    attr_writer :email, :password
    
    class << self
      def keys
        @keys ||= [:email, :password]
      end
    end
    
    # Allow block configuration
    def configure
      yield self
      format_email!
      format_password!
      self
    end
    
    private
    
      # @return [Hash]
      def credentials
        {
          email:    @email,
          password: @password 
        }
      end
    
      # Ensure email is correct format for RestClient posts
      def format_email!
        @email = CGI.escape @email
      end
      def format_password!
        @password = CGI.escape @password
      end
    
  end
end