require 'simple_memcache_client/server'

class SimpleMemcacheClient::Client

  def initialize(hostname, port=11211)
    @hostname = hostname
    @port = port
  end

  def set(key, value, ttl=0)
    server.set(key, value, ttl)
  end

  def get(key)
    server.get(key)
  end

  private

  def server
    @server ||= SimpleMemcacheClient::Server.new(@hostname, @port)
  end

end
