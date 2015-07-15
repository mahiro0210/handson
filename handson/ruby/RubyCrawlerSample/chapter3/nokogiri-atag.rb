# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

nodesets = doc.xpath('//a')
puts "---innet_text"
puts nodesets.inner_text

puts "---each"
nodesets.each{|node|
	puts node.inner_text # => Yahoo! JAPAN
}