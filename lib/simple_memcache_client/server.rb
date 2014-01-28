require 'socket'

class SimpleMemcacheClient::Server

  def initialize(hostname, port)
    @hostname = hostname
    @port = port
    @lock = Monitor.new
  end

  def set(key, value, ttl)
    @lock.synchronize do
      req = "set #{key} 0 #{ttl} #{value.bytesize}\n#{value}\r\n"
      write(req)
      stored?
    end
  end

  def get(key)
    @lock.synchronize do
      req = "get #{key}\r\n"
      write(req)
      read_result
    end
  end

  private

  def socket
    @socket ||= TCPSocket.new(@hostname,@port)
  end

  def write(bytes)
    socket.write(bytes)
  end

  def gets
    socket.gets
  end

  def read_result
    if socket.gets =~ /^VALUE/
      val = ''
      loop do
        line = socket.gets
        break if line =~ /^END/
        val << line
      end
      val.chomp
    end
  end

  def stored?
    gets == "STORED\r\n"
  end
end
