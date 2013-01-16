module NerdwordClient
  module Resources
    class Game < Resource
      attr_accessor :users, :links

      def initialize(attrs)
        @users = attrs.fetch("_embedded").fetch("users").map { |user_attrs| User.new(user_attrs) }
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
