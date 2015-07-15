# -*- coding: utf-8 -*-
require 'nokogiri'
require 'anemone'

opts = {
    depth_limit: 0 
        # 0 => 指定したURL先のみ
        # 1 => 指定したURLにあるlinkから1回のジャンプで辿れる先も見る。
}

Anemone.crawl("http://www.cainer.jp/today/aquarius.html", opts) do |anemone|
    anemone.on_every_page do |page|
#      p page
#      p page.doc.xpath("//title").to_s
      puts  #page.doc.xpath("/html/body/div[@id='container']/div[@id='content']/table/tr/td/table/tr/td/div[contains(@style,'font')]/p").to_s
          #page.doc.xpath("/html/body/div[@id='container']/div[@id='content']/table/tr/td/table/tr/td/div[contains(@style,'font')]").each do |node|
            page.doc.xpath("/html/body/div[@id='container']/div[@id='content']/table/tr/td/table/tr/td").each do |node|
              p "日付" + ":" + node.xpath("./h2/text()").to_s
              p "タイトル" + ":" + node.xpath("./div[1]/p/b/text()").to_s
              p "占い" + ":" + node.xpath("./div[1]/p/text()").to_s
              #puts node.class
              # puts "xxxx"
        
              #puts "xxxx" + ":" + node.xpath("./div[contains(@style,'font')]/text()").to_s
              
             # p node.xpath("./text()").to_s
              
              #              p page.doc.xpath("./p/text()").to_s
            end
#      p page.doc.css("html body div#container.clearfix div#content table tbody tr td table tbody tr td div p").to_s
      #page.doc.xpath("//div[@id='content']/table/tbody/tr/td/table/tbody/tr/td").each do |node|
#      page.doc.xpath("/html/body/div[@id='conatiner']/div[@id='content']/table/tbody/tr/td/table/tbody/tr/td/div[1]").each do |node|
#      page.doc.xpath("/html/body/div[3]/div[2]/table/tr/td/table/tr/td/div[1]/p").each do |node|
 #       p node.xpath("./b/text()").to_s
        
   #   end
        #     page.doc.xpath("//div/p").each do |node|
#        bun  = node.xpath("./p/text()").to_s
#        p bun
        #            price = #node.xpath("./td[contains(@class,'price'))]/div[@class='money']/span/text()").to_s
#            puts area + "：" + price + "万円" # がっちゃんこ。
#        puts bun
        #end
    end
end
