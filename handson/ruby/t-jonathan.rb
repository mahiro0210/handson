#!/home/action/.parts/opt/rubies/ruby-2.1.1/bin/ruby 
# -*- coding: utf-8 -*-
require 'nokogiri'
require 'anemone'
require 'rubygems'
require 'twitter'
require 'bitly'

def bitly_shorten(url)
  Bitly.use_api_version_3
  Bitly.configure do |config|
    config.api_version = 3
    config.access_token = "c6105e98476ab62485a2a138cf3c6eac7dc165ca"
  end
  Bitly.client.shorten(url).short_url
end

config = {
	:consumer_key => 'pf65Qr5Td0cjMEUa9rGtVXaol',
	:consumer_secret => 'K3C9QeMPO4oS0jRksxe18QkoNUYzqTwkmFVohHxSsAu7S1UhE1',
	:access_token => '315693748-IWW9nxDMw03ceAhcdTNn8XVQp7MkayIiDkKw1qjc',
	:access_token_secret => 'mFTQV4BSIjs44936CChYbLI6H3hByMabDf3XLdSGPXqaW'
}

rest_client = Twitter::REST::Client.new(config)

url = "http://www.cainer.jp/today/aquarius.html"
short_url = bitly_shorten(url)

opts = {
    depth_limit: 0 
}

Anemone.crawl("http://www.cainer.jp/today/aquarius.html", opts) do |anemone|
    anemone.on_every_page do |page|
        page.doc.xpath("/html/body/div[@id='container']/div[@id='content']/table/tr/td/table/tr/td").each do |node|
            title = "日付" + ":" + node.xpath("./h2/text()").to_s
            bitly_url = "URL" + ":" + short_url
            fortune = "占い" + ":" + node.xpath("./div[1]/p/text()").to_s
            rawstring = "#{title}\n#{bitly_url}\n#{fortune}" 
            trimstring = rawstring[0,139]
            rest_client.create_direct_message('hiromaki0210', "#{trimstring}")

        end
    end
end