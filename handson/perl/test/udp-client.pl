use IO::Socket;

my $c = IO::Socket::INET->new(
  PeerAddr => "localhost",
  PeerPort => 9999,
  Proto    => "udp"
) or die $!;

$c->send("hello");
$c->close;