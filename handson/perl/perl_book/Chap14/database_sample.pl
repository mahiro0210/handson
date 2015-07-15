use strict;
use warnings;

use DBI;

# メモリ上のデータベースへ接続
my $dbh = DBI->connect("dbi:SQLite:dbname=:memory:");

# テーブルの作成
my $create_table = "CREATE TABLE book (" .
                       "title," .
                       "author" .
                   ");";
$dbh->do($create_table);

# INSERT文の実行
$dbh->do("INSERT INTO book (title, author) VALUES ('Perl', 'taro');");
$dbh->do("INSERT INTO book (title, author) VALUES ('C++', 'taro');");
$dbh->do("INSERT INTO book (title, author) VALUES ('Python', 'ken');");
$dbh->do("INSERT INTO book (title, author) VALUES ('Java', 'mamoru');");

# UPDATE文の実行
$dbh->do("UPDATE book SET title = 'Ruby' WHERE author = 'mamoru'");

# DELETE文の実行
$dbh->do("DELETE FROM book WHERE author = 'ken';");

# SELECT文の実行
my $sth = $dbh->prepare("SELECT * FROM book;");
$sth->execute;

# 各行のフェッチ
while (my @row = $sth->fetchrow_array) {
    # 各行を出力
    print join(', ', @row), "\n";
}