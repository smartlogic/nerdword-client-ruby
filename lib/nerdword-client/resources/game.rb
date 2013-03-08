module NerdwordClient
  module Resources
    # Game of NerdWord
    #
    # Requires embedded users and links
    #
    #   Game.load({
    #     "_embedded" => {
    #       "users" => [
    #         { "email" => "eric@example.com" },
    #         { "email" => "nestor@example.com" }
    #       ]
    #     },
    #     "_links" => {
    #       "self" => { "href" => ".." },
    #       "http://nerdwordapp.com/rels/turns" => { "href" => "..." },
    #       "http://nerdwordapp.com/rels/current-turn" => { "href" => "..." }
    #     }
    #   }.to_json)
    class Game < Resource
      # @return [Array<User>]
      attr_reader :users

      # @return [Links]
      attr_reader :links

      def initialize(attrs)
        @users = attrs.fetch("_embedded").fetch("users").map { |user_attrs| User.new(user_attrs) }
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
