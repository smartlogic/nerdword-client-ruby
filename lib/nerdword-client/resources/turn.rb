module NerdwordClient
  module Resources
    # A game turn
    #
    # Requires embedded users, a rack, and links
    #
    #   Turn.load({
    #     "rack" => "LETTERS",
    #     "_embedded" => {
    #       "user" => {
    #         "email" => "eric@example.com"
    #       }
    #     },
    #     "_links" => {
    #       "self" => {
    #         "href" => "..."
    #       },
    #       "http://nerdwordapp.com/rels/game" => {
    #         "href" => "..."
    #       }
    #     }
    #   }.to_json)
    class Turn < Resource
      # @return [Links]
      attr_reader :links

      # @return [User]
      attr_reader :user

      # @return [String]
      attr_reader :rack

      def initialize(attrs)
        @user = User.new(attrs.fetch("_embedded").fetch("user"))
        @rack = attrs.fetch("rack")
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
