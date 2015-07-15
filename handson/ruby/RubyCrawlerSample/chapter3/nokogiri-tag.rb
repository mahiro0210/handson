# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))
title = doc.xpath('/html/head/title')
title2 = doc.css('title')
objects = doc.xpath('//a')

puts title
puts title2
puts objects