use IO::Socket;

my $file = "./server-list2" ;
#file open 
open my $fh, '<', $file
    or die qq{can't open file "$file" : $!};

while (my $line =<$fh>){
    chomp $line;
    my @rec = split /,/, $line;
    $addr = $rec[0];
    $proto  = $rec[1];
    $port = $rec[2];
    if ($proto eq "t") {
      tsrv($addr,$proto,$port);
    } else {
      usrv($addr,$proto,$port);
    }
}
close $fh;

sub tsvr {

my $addr,$proto,$port;

print <<"EOF";
use IO::Socket;

my $s = IO::Socket::INET->new(
  LocalAddr => $addr,
  LocalPort => $port,
  Proto     => "tcp",
  Listen    => 2,
  ReuseAddr => 1
) or die $!;

$s->listen or die $!;

while(my $c = $s->accept){
  my $q = $c->getline;
  print $q;
  $c->print("hello\n");
  $c->close;
  }
$s->close;
}

sub usrv {
use IO::Socket;
my $addr,$proto,$port;
my $s = IO::Socket::INET->new(
  LocalAddr => $addr,
  LocalPort => $port,
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
}
