use Net::FTP;

my $host = 'somehost';

my $ftp = Net::FTP->new($host)
    or die qq{Can't connect to "$host": $!};
$ftp->login('user', 'password')
    or die qq{Can't login "$host": } . $ftp->message;

$ftp->get('/dir/somefile')
    or die "FTP command fail: " . $ftp->message;

$ftp->quit;
