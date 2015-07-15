#!/usr/bin/perl

use IO::Socket;

$sock = new IO::Socket::INET(PeerAddr=>'localhost',
	PeerPort=>50001,
	Proto=>'udp',
        Type=>SOCK_DGRAM
        );
die "IO::Socket : $!" unless $sock;

print <$sock>;

close($sock);
