module NerdwordClient
  module Resources
    class Games < Resource
      extend Forwardable
      include Enumerable

      def_delegators :games, :each, :[]

      attr_accessor :games, :links

      def initialize(attrs)
        @games = attrs.fetch("_embedded", {}).fetch("games", []).map { |game_attrs| Game.new(game_attrs) }
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
