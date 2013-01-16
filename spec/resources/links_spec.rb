require 'spec_helper'


describe NerdwordClient::Resources::Links do
  subject { NerdwordClient::Resources::Links.new(link_hash) }

  let(:self_link) { {
    "href" => "http://nerdwordapp.com/"
  } }
  let(:games_link) { {
    "href" => "http://nerdwordapp.com/games"
  } }

  let(:link_hash) { {
    "self" => self_link,
    "http://nerdwordapp.com/rels/games" => games_link
  } }

  describe "#fetch" do
    it "should fetch registered relations" do
      subject.fetch("self").should == self_link["href"]
    end

    it "should fetch custom relations" do
      subject.fetch("games").should == games_link["href"]
    end

    it "should handle a key miss" do
      subject.fetch("not-there").should == ""
    end
  end

  describe "#has_link?" do
    it "should be true for registered relations that are included" do
      subject.has_link?("self").should be_true
    end

    it "should be false for registered releations that are not included" do
      subject.has_link?("next").should be_false
    end

    it "should be true for custom relations that are included" do
      subject.has_link?("games").should be_true
    end

    it "should be false for custom relations that are not included" do
      subject.has_link?("not-there").should be_false
    end
  end
end
