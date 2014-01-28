simple_memcache_client
======================

a really simple memcache client to play with socket and threading pool

## Installation

Add this line to your application's Gemfile:

    gem 'simple_memcache_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_memcache_client

## Usage

You just need instanciate a client and you can do get and set.

```
require 'simple_memcache_client'

client = SimpleMemcacheClient.new('localhost')
client.set('foo', 'bar', 1)
client.set('bar', 'baz')
puts client.get('foo')
puts client.get('bar')
client.close
```

You can define a pool of socket you want.

```
require 'simple_memcache_client'

client = SimpleMemcacheClient.new('localhost', 11211, 10)
500.times do |i|
  threads << Thread.new do
    client.set('foo', 'bar', 1)
    client.set('bar', 'baz')
    puts client.get('foo')
    puts client.get('bar')
  end
end
client.close
```

Only 10 sockets are connect to memecached


## Test

There are some test attach to this project. You can launch it by

```
rake spec
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/simple_memcache_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
