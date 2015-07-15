# -*- coding: utf-8 -*-
require 'koala'

graph = Koala::Facebook::API.new('CAAL60zzbttgBALeAloeDfdCHJlIqxBft3oPZAxwqOZAY5wcZAANgbCidHRhuRl8A8imqclNGzNb3yXc83ZA6kZCY2FYvpUipiXE1ZC54SZA7MAqS52btB5n1cLZChZCNStjnigaydr9s5ZBZBrLXIPnao55C9XPZBABmBi0ZBNvqolDRobZCv5rMEOUp112JT8lf54ZCXuVZAuwD8WLv9nxeWT5hA02J72J3lyATP18ZD')

# BRAVIAについて言及している発言を取得
search = graph.search('BRAVIA')
search.each {|result|
	puts result['message']
	# 発言主の情報を取得
	who = graph.get_object(result['from']['id'].to_s)
	puts "性別：" + who['gender'].to_s
	puts "生年月日：" + who['birthday'].to_s
}