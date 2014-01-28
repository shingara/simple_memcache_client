require "simple_memcache_client/version"

###
# Implement a simple memcached client in Ruby that uses the text protocol of memcached (
# http://www.lzone.de/articles/memcached.htm - https://github.com/memcached/memcached/blob/master/doc/protocol.txt).
# To keep things simple consider the following limitations:
#
# Implement only the GET and SET commands
# The keys and values that are read and written are all Strings. There's no conversion and no escape to handle
# The client manage a fixed size pool of 5 connections, all created at startup and closed at exit.
#
# There's no particular constraint on the API or the design that you'll propose besides the above points.
# Keep in mind that the goal of this exercise is just to discuss on how you would do it,
# so focus on delivering something clean and robust but make sure you spend a reasonable amount of your time on it,
# we certainly don't want to waste too much of it.

module SimpleMemcacheClient
  # Your code goes here...
end

require 'simple_memcache_client/client'
