use strict;
use warnings;
use utf8;

use Encode qw/decode encode/;

while (my $line = <>) {
    my $line = decode('UTF-8', $line);
    $line =~ s/あ/ア/g;
    # print encode('cp932', $line);
    print encode('UTF-8', $line);
}
