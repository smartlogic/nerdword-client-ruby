require 'spec_helper'

describe NerdwordClient::Resources::Games do
  subject { NerdwordClient::Resources::Games.load(games_resource.to_json) }

  let(:games_resource) { {
    :_embedded => {
      :games => [
        game_resource
      ]
    },
    :_links => {}
  } }

  let(:game_resource) { {
    :_embedded => {
      :users => [
        user_resource
      ]
    },
    :_links => {}
  } }

  let(:user_resource) { {
    :email => "eric@example.com"
  } }

  it { should load_links }

  it "should load games" do
    subject.should have(1).games
  end

  it "should handle no games present" do
    games = NerdwordClient::Resources::Games.load(%{{"_links": {}}})
    games.should have(0).games
  end

  it "should forward #[] to games" do
    subject[0].should == subject.games[0]
  end

  it "should forward each to games and include Enumerable" do
    subject.count.should == subject.games.count
  end
end
