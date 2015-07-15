use strict;
use warnings;

use DBI;

my $database = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
my $dbh = DBI->connect($data_source);

# ‡@prepare‚ÅSQL‚ð€”õ
my $sql = "INSERT INTO book (title, author) VALUES (?, ?);";
my $sth = $dbh->prepare($sql);

# ‡Aexecute‚Å’l‚ð–„‚ßž‚ñ‚ÅŽÀs
$sth->execute('Perl', 'taro');
