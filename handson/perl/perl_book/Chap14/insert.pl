use strict;
use warnings;

use DBI;

my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);

# �@prepareでSQLを準備
my $sql = "INSERT INTO book (title, author) VALUES (?, ?);";
my $sth = $dbh->prepare($sql);

# �Aexecuteで値を埋め込んで実行
$sth->execute('Perl', 'taro');
