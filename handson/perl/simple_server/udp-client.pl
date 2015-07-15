use IO::Socket;

$HOSTNAME = "localhost";
$PORTNO = 2222;
$MSG = "hoge";
$MAXLEN = 100;

$handle = IO::Socket::INET->new(Proto => 'udp') 
    or die "socket: $@";     # yes, it uses $@ here
#Then to send a message to a machine named $HOSTNAME on port number $PORTNO , use:

$ipaddr   = inet_aton($HOSTNAME);
#$ipaddr = inet_ntoa($HOSTNAME);
$portaddr = sockaddr_in($PORTNO, $ipaddr);
send(SOCKET, $MSG, 0, $portaddr) == length($MSG)
        or die "cannot send to $HOSTNAME($PORTNO): $!";

#To receive a message of length no greater than $ MAXLEN , use:

$portaddr = recv(SOCKET, $MSG, $MAXLEN, 0)      or die "recv: $!";
($portno, $ipaddr) = sockaddr_in($portaddr);
$host = gethostbyaddr($ipaddr, AF_INET);
print "$host($portno) said $MSG\n";