use strict;
use warnings;

use DBI;

my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);


my $sql = "UPDATE book SET title = ? WHERE author = ?;";
my $sth = $dbh->prepare($sql);
$sth->execute('Ruby', 'taro');
