
use IO::Socket;

file open 

while 
read l：ｗｑ！ine o
addr=$1
port=$2
proto=$3

if udp 
 sub udp
else
 sub tcp
end


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
