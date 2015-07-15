require "rubygems"
require "dnsruby"

adn_ns = ["ns1.hostingnow.jp","ns2.hostingnow.jp"]

f = open("./adn.co.jp")

f.each {|line|
/^(.+)\s+([0-9]+)\s+(\w+)\s+(\w+)\s+(.+)$/ =~ line
case $4
when "NS"
  puts `dig \@#{$5} #{$1} ns`
when "NS"
  puts `dig \@#{$5} #{$1} ns`
when "NS"
  puts `dig \@#{$5} #{$1} ns`
  puts "pass"
else
  puts "excellent"
end
}
f.close
 
TARGETNAME="twitter.com"
NAMESERVER="8.8.8.8"
resolver = Dnsruby::Resolver.new(:nameserver=>NAMESERVER)
answers = resolver.query(TARGETNAME).answer
answers.each do |answer|
  print "#{answer.type.to_s} : #{answer.to_s}\n"
end
