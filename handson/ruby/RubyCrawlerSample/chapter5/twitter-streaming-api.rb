# -*- coding: utf-8 -*-
require 'twitter'

config = {
	:consumer_key => 'pf65Qr5Td0cjMEUa9rGtVXaol',
	:consumer_secret => 'K3C9QeMPO4oS0jRksxe18QkoNUYzqTwkmFVohHxSsAu7S1UhE1',
	:access_token => '315693748-wTT9eKN5vMODcx3IrRfA7Xr8XO5dXHg8pXxAqIiX',
	:access_token_secret => 'NdTPy0TlZQ4YsdQRngglqOWeXve5M8U8JKoj0xZK4Fz2F'
}

client = Twitter::Streaming::Client.new(config)
client.sample do |tweet|
	if tweet.is_a?(Twitter::Tweet)
	# 日本語のつぶやきだけ表示
		puts tweet.text if tweet.lang == "ja"
	end
end