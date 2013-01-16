require 'spec_helper'

describe NerdwordClient::Resources::Root do
  subject { NerdwordClient::Resources::Root.load(root_resource.to_json) }

  let(:root_resource) { {
    :_links => {}
  } }

  it { should load_links }
end
