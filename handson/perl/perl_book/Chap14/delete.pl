use strict;
use warnings;

use DBI;
my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);

my $sql = "DELETE FROM book WHERE author = ?;";
my $sth = $dbh->prepare($sql);
$sth->execute('taro');
