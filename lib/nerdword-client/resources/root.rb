module NerdwordClient
  module Resources
    class Root < Resource
      attr_accessor :links

      def initialize(attrs)
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
