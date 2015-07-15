#!/usr/bin/perl
#use strict;
#use warnings;

use IO::Socket;

$sock0 = new IO::Socket::INET(
#	Listen=>5,
#	LocalAddr=>'localhost',
	LocalPort=>12345,
	Proto=>'udp'
#       Type=>SOCK_DGRAM,
#	Reuse=>1
	);

die "IO::Socket : $!" unless $sock0;
$sock = $sock0->accept();
print $sock "HELLO\n";

close($sock);
#close($sock0);

exit;
