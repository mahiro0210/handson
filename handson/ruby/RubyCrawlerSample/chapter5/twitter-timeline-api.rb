# -*- coding: utf-8 -*- 
require 'twitter'

config = {
	:consumer_key => 'pf65Qr5Td0cjMEUa9rGtVXaol',
	:consumer_secret => 'K3C9QeMPO4oS0jRksxe18QkoNUYzqTwkmFVohHxSsAu7S1UhE1',
	:access_token => '315693748-wTT9eKN5vMODcx3IrRfA7Xr8XO5dXHg8pXxAqIiX',
	:access_token_secret => 'NdTPy0TlZQ4YsdQRngglqOWeXve5M8U8JKoj0xZK4Fz2F'
}

client = Twitter::REST::Client.new(config)
client.user_timeline('dkfj').each {|tweet|
	# Tweet時間
	puts tweet.created_at

	# Tweet本文
	puts tweet.text

	# Retweet数
	puts "Retweetされた数 : " + tweet.retweet_count.to_s

	# お気に入りされた数
	puts "お気に入りされた数 : " + tweet.favorite_count.to_s

	# 位置情報
	puts "位置情報 : " + tweet.geo if !tweet.geo.nil?
}
