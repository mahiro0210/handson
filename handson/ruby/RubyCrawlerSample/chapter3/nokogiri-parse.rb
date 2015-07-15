# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))
p doc

puts "--- Nokogiri parse 1 ---"
doc = Nokogiri::HTML.parse(open('http://www.yahoo.co.jp'))
p doc
puts "--- Nokogiri parse 2 ---"
doc = Nokogiri.parse(open('http://www.yahoo.co.jp'))
p doc

doc = Nokogiri::HTML.parse('http://www.amazon.co.jp', nil, "Shift-JIS")
doc = Nokogiri::HTML.parse(open('http://www.amazon.co.jp'))
p doc