require 'spec_helper'

describe NerdwordClient::Resources::Turns do
  subject { NerdwordClient::Resources::Turns.load(turns_resource.to_json) }

  let(:turns_resource) { {
    :_embedded => {
      :turns => [
        turn_resource
      ]
    },
    :_links => {}
  } }

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

  it "should load turns" do
    subject.should have(1).turns
  end

  it "should forward #[] to turns" do
    subject[0].should == subject.turns[0]
  end

  it "should forward each to turns and include Enumerable" do
    subject.count.should == subject.turns.count
  end
end
