use strict;
use warnings;

# �@配列の宣言とコマンドライン引数の受け取り
my @nums = @ARGV;

# �Aforeach文：和の計算
my $total;
foreach my $num (@nums) {
    $total += $num;
}

# 和の出力
print "Total:$total\n";