module NerdwordClient
  module Resources
    class Resource
      def self.load(string)
        new(JSON.load(string))
      end
    end
  end
end
