module NerdwordClient
  module Resources
    # Handles HAL links
    class Links
      def initialize(link_hash)
        @links = link_hash
      end

      # Fetch out links not worrying about custom rels
      #
      # @param [String] link relation
      #
      # @return [String] href
      def fetch(link)
        link = rel(link) if !@links.has_key?(link)
        @links.fetch(link, {}).fetch("href", "")
      end

      # Check if a link rel is included
      #
      # @param [String] link relation
      #
      # @return [Boolean]
      def has_link?(link)
        @links.has_key?(link) || @links.has_key?(rel(link))
      end

      private

      # Create a custom link relation
      #
      # @param [String] rel link relation name
      #
      # @return [String] custom link relation
      def rel(link)
        "http://nerdwordapp.com/rels/#{link}"
      end
    end
  end
end
