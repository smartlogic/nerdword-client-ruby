module NerdwordClient
  module Resources
    # "/"
    #
    # Requires "_links" attribute
    #
    #   Root.load({
    #     "_links" => {
    #       "self" => {
    #         "href" => "..."
    #       },
    #       "http://nerdwordapp.com/rels/games" => {
    #         "href" => "..."
    #       }
    #     }
    #   }.to_json)
    class Root < Resource
      attr_accessor :links

      def initialize(attrs)
        @links = Links.new(attrs.fetch("_links"))
      end
    end
  end
end
