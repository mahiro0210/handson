use IO::Socket;

$server_host = 'localhost';
$server_port = 2020;

$server = IO::Socket::INET->new(LocalAddr => $server_host,
                                LocalPort => $server_port,
                                Type      => SOCK_STREAM,
                                Reuse     => 1,
                                Listen    => 10 )   # or SOMAXCONN
    or die "Couldn't be a tcp server on port $server_port : $@\n";

while ($client = $server->accept()) {
    # $client is the new connection
}

close($server);