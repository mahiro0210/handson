use IO::Socket;

my $s = IO::Socket::INET->new(
  LocalAddr => "localhost",
  LocalPort => 9999,
  ReuseAddr => 1,
  Proto     => "udp"
) or die $!;

while(1){
  my $buf;
  my $ca = $s->recv($buf, 65535);
  my($port, $addr) = unpack_sockaddr_in($ca);
  my($ip, $host) = (inet_ntoa($addr), gethostbyaddr($addr, AF_INET));
  print "$buf from $host($ip):$port\n";
}

$s->close;