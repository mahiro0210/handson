use strict;
use warnings;

use DBI;
use DBIx::Custom;

my $dbi = DBIx::Custom->connect(dsn => "dbi:SQLite:dbname=:memory:");

# ƒe[ƒuƒ‹‚Ìì¬
my $create_table = "CREATE TABLE book (" .
                       "title," .
                       "author" .
                   ");";
$dbi->do($create_table);

# INSERT
$dbi->insert({title => 'Perl', author => 'Ken'},
             table  => 'book');

# UPDATE
$dbi->update({title => 'Perl', author => 'Taro'}, 
             table  => 'book', 
             where  => {title => 'Perl'});

# DELETE
$dbi->delete(table  => 'book',
             where  => {author => 'Ken'});

# SELECT
my $result = $dbi->select(table => 'book');

while (my $row = $result->fetch_hash) {
    print $row->{author} . "\n";
    print $row->{title} . "\n";
}