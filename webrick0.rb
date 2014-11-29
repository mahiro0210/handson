#! /usr/bin/env ruby

require 'webrick'
Thread.start{
 WEBrick::HTTPServer.new(DocumentRoot:".",
  Port:7777, BindAddress:"192.168.201.184").start
}
gets