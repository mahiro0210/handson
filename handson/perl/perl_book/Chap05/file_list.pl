use strict;
use warnings;

my $dir = '/home/action/handson/perl/Chap05';

opendir my $dh, $dir
    or die qq/Can't open directory: $!/;

my @files;
while (my $file = readdir $dh) {
    next if $file eq '.' || $file eq '..';
    push @files, $file;
}

foreach my $file_list (@files) {
 print "$file_list\n";
}

closedir $dh;
