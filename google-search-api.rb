# -*- coding: utf-8 -*-

require 'google-search'

Google::Search::Web.new(:query => 'クローラ').each do |item|
  puts item.uri
  puts item.title
end
