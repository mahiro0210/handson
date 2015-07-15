use strict;
use warnings;

use DBI;

my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);


my $sql = "SELECT * FROM book;";
my $sth = $dbh->prepare($sql);
$sth->execute;

while (my @row = $sth->fetchrow_array) {
    print @row;
}

