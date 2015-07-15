use XML::Simple;
use Data::Dumper 'Dumper';

my $xml = XML::Simple->new;
my $conf = $xml->XMLin('conf.xml');

print Dumper $conf;
