module NerdwordClient
  module Resources
    class Turns < Resource
      extend Forwardable
      include Enumerable

      def_delegators :turns, :each, :[]

      attr_accessor :turns, :links

      def initialize(attrs)
        @turns = attrs.fetch("_embedded", {}).fetch("turns", []).map { |turn_attrs| Turn.new(turn_attrs) }
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
