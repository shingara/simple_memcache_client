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

  it 'with a client and thread env' do
    client = SimpleMemcacheClient::Client.new('localhost', 11211, 10)
    threads = []
    500.times do |i|
      threads << Thread.new do
        foo = "foo_#{i}"
        bar = "bar_#{i}"
        client.set(foo, "v_#{foo}")
        client.set(bar, "v_#{bar}")
        [client.get(foo), client.get(bar)]
      end
    end
    threads.map(&:value)
  end
end
