use strict;
use warnings;

my $file = shift;

die "Usage: $0 FILE"  unless defined $file;

open my $fh, '<', $file
  or die qq{Can't open file: "$file": $!};

my %address;
my $i = 0;
while (my $line = <$fh>) {
    chomp $line;
#    print "$i";
    $i += 1;
    $address{$line} = "113SF-deny-host${i}";   
#    print "key=${line}, value=${address{$line}}\n";
}

#print "#--- generate address objects ---#\n";
#while (my ($key, $value) = each %address) {
#  print "%address{$key} =" . $address{$key} . "\n";
#  print "set address $value ip-netmask $key\n";
#}

print "#--- generate address objects ---#\n";
for my $key (sort keys %address) {
  print "set address $address{$key} ip-netmask $key/32\n";
}

print "#--- generate group object ---#\n";
print "set address-group deny-hosts-list static [ ";
for my $key (sort keys %address) {
  print "$address{$key} ";
}
print "]\n";

close $fh;
