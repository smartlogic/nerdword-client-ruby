module NerdwordClient
  module Resources
    class Links
      def initialize(link_hash)
        @links = link_hash
      end

      def fetch(link)
        link = rel(link) if !@links.has_key?(link)
        @links.fetch(link, {}).fetch("href", "")
      end

      def has_link?(link)
        @links.has_key?(link) || @links.has_key?(rel(link))
      end

      private

      def rel(link)
        "http://nerdwordapp.com/rels/#{link}"
      end
    end
  end
end
