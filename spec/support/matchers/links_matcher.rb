module CustomMatchers
  class LinksMatcher
    def matches?(actual)
      actual.links.is_a?(NerdwordClient::Resources::Links).should == true
    end

    def failure_message
      "Does not pull out links"
    end
  end

  def load_links
    LinksMatcher.new
  end
end
