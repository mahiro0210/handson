use IO::Socket;

my $s = IO::Socket::INET->new(
  LocalAddr => "localhost",
  LocalPort => 9999,
  Proto     => "tcp",
  Listen    => 10,
  ReuseAddr => 1
) or die $!;
# Proto や Listen, ReuseAddr は渡さなくても良い
# Listen : bind() に渡される接続待ちキューの最大数
# ReuseAddr : setsockopt( SO_REUSEADDR, 1) と同じ

$s->listen or die $!;

while(my $c = $s->accept){
  my $q = $c->getline;
  print $q;
  $c->print("hello\n");
  $c->close;
}

$s->close;