module NerdwordClient
  module Resources
    # Base Resource class
    #
    # Adds Resource.load to classes for parsing JSON
    class Resource
      def self.load(string)
        new(JSON.load(string))
      end
    end
  end
end
