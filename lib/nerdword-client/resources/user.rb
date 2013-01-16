module NerdwordClient
  module Resources
    class User < Resource
      attr_accessor :email

      def initialize(attrs)
        @email = attrs.fetch("email")
      end
    end
  end
end
