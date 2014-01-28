require 'socket'

class SimpleMemcacheClient::Server

  def initialize(hostname, port)
    @hostname = hostname
    @port = port
  end

  def set(key, value, ttl)
    req = "set #{key} 0 #{ttl} #{value.bytesize}\n#{value}\r\n"
    socket.write(req)
    socket.gets == "STORED\r\n"
  end

  def get(key)
    req = "get #{key}\r\n"
    write(req)
    read_result
  end

  private

  def socket
    @socket ||= TCPSocket.new(@hostname,@port)
  end

  def write(bytes)
    socket.write(bytes)
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
end
