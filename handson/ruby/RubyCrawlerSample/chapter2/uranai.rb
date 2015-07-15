require 'nokogiri'
require 'open-uri'

doc = Nokogiri.HTML(open("http://www.cainer.jp/today/aquarius.html"))
doc.css('a').each do |element|
  puts element[:href]
end