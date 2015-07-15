# anemone3.rb
require 'anemone'
require 'nokogiri'
require 'kconv'

URL = ARGV[0]

Anemone.crawl(URL,:depth_limit => 1) do |anemone|
  PATTERN = %r[lego-scrum.html|summer_intern2014.html|agile_whiteboards.html]

 anemone.focus_crawl do |page|
    page.links.keep_if{ |link|
      link.to_s.match(PATTERN)
    }
  end

 anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    body = doc.xpath(%Q[//*[@id="content"]/article/div[3]])

 body.css('h2').each do |h2|
      puts h2.text
    end
  end
end
