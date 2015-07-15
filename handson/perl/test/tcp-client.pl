use IO::Socket;

my $c = IO::Socket::INET->new(
  PeerAddr => "localhost",
  PeerPort => 9999,
  Proto    => "tcp"
) or die $!;
# 単に new("localhost:9999") でも良い
# デフォルトで TCP がプロトコルとして用いられる

$c->print("hello\n");
print $c->getline;

$c->close;