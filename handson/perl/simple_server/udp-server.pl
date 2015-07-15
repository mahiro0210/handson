use IO::Socket;

$server_port = 2222;

$server = IO::Socket::INET->new(LocalPort => $server_port,
                                Proto     => "udp")
    or die "Couldn't be a udp server on port $server_port : $@\n";
#Then, go into a loop receiving messages:

while ($him = $server->recv($datagram, $MAX_TO_READ, $flags)) {
    # do something
} 
