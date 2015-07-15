use strict;
use warnings;

# ファイルから1行ずつ読み込む
while (my $line = <>) {

    # 行の先頭が改行である場合は読み飛ばす
    next if $line =~ /^\n/;

    # 出力
    print $line;
}