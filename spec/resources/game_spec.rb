require 'spec_helper'

describe NerdwordClient::Resources::Game do
  subject { NerdwordClient::Resources::Game.load(game_resource.to_json) }

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

  it "should load users" do
    subject.should have(1).users
  end
end
