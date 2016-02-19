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
  end
end
