module NerdwordClient
  module Resources
    # User
    #
    # Requires "email" attribute
    #
    #   User.load({
    #     "email" => "user@example.com"
    #   }.to_json)
    class User < Resource
      attr_accessor :email

      def initialize(attrs)
        @email = attrs.fetch("email")
      end
    end
  end
end
