module NerdwordClient
  module Resources
    # List of turns that are associated with a Game
    #
    # Requires "_links" attribute
    #
    #   turns = Turns.load({
    #     "_embedded" => {
    #       "turns" => [
    #         "..."
    #       ]
    #     },
    #     "_links" => {
    #       "self" => {
    #         "href" => "..."
    #       }
    #     }
    #   }.to_json)
    #
    #   turns.each do |turn|
    #     puts turn.user.email
    #   end
    class Turns < Resource
      extend Forwardable
      include Enumerable

      def_delegators :turns, :each, :[]

      # @return [Array<Turn>]
      attr_reader :turns

      # @return [Links]
      attr_reader :links

      def initialize(attrs)
        @turns = attrs.fetch("_embedded", {}).fetch("turns", []).map { |turn_attrs| Turn.new(turn_attrs) }
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
