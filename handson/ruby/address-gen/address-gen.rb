# -*- coding: utf-8 -*-

inf = open("address.txt")
table = {}

i=0
inf.each_line { |line| 
  table.store("deny-host#{i += 1}" , line)
} 

print "#--- print generate key and value ---#\n"
table.each { |key, value|
  print(key + "=>", value)
}

print "#--- genarate address objects.---#\n"
table.each { |key, value|
  print "set address #{key} ip-netmask #{value}"
}

print "#--- genarate address group objects.---#\n"
print "set address-group denyhost-lists static ["
table.each { |key, value|
  print " #{key} "
}
print "]\n"
