require 'spec_helper'

describe NerdwordClient::Resources::Turn do
  subject { NerdwordClient::Resources::Turn.load(turn_resource.to_json) }

  let(:turn_resource) { {
    :_embedded => {
      :user => user_resource
    },
    :rack => "",
    :_links => {}
  } }

  let(:user_resource) { {
    :email => "eric@example.com"
  } }

  it { should load_links }

  it "should load the user" do
    subject.user.should_not be_nil
  end
end
