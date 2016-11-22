require "spec_helper"

describe Lita::Handlers::RandomName, lita_handler: true do
  it { is_expected.to route('randomname') }
  it { is_expected.to route('random_name') }
  it { is_expected.to route('randomname').to(:random_name) }
  it { is_expected.to route('random_name').to(:random_name) }
  it 'returns random name' do
    test_regex = /[A-Za-z\-0-9]+/
    send_message('random_name')
    expect(replies.last).to match(test_regex)
  end
end
