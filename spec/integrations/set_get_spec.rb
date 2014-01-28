require 'spec_helper'

describe "Basic usage" do
  let(:first_value) do
    /\w+/.gen
  end
  let(:second_value) do
    /\w+/.gen
  end

  it 'set value and get it' do
    client = SimpleMemcacheClient::Client.new('localhost')
    client.set('foo', first_value)
    client.set('bar', second_value)
    expect(client.get('foo')).to eq first_value
    expect(client.get('bar')).to eq second_value
  end
end
