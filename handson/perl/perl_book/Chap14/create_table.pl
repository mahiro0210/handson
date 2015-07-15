use strict;
use warnings;

use DBI;

my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);

my $sql = <<"EOS";
CREATE TABLE book (
  title,
  author
);
EOS

$dbh->do($sql);

