require 'simple_memcache_client/server'

class SimpleMemcacheClient::Client

  def initialize(hostname, port=11211, pool_size=5)
    @hostname = hostname
    @port = port
    @pool_size = pool_size
  end

  def set(key, value, ttl=0)
    server.set(key, value, ttl)
  end

  def get(key)
    server.get(key)
  end

  def close
    servers.each(&:close)
  end

  private

  def servers
    @servers ||= Array.new(@pool_size).map do
      SimpleMemcacheClient::Server.new(@hostname, @port)
    end
  end

  def server
    servers.sample
  end

end
