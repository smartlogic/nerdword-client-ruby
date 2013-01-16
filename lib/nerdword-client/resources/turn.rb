module NerdwordClient
  module Resources
    class Turn < Resource
      attr_accessor :links, :user, :rack

      def initialize(attrs)
        @user = User.new(attrs.fetch("_embedded").fetch("user"))
        @rack = attrs.fetch("rack")
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
