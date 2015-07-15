use strict;
use warnings;

# 日付と時刻
my $datetime = '2010/12/01 10:54:33';

my $year;
my $month;
my $mday;

my $hour;
my $minute;
my $second;

# 年月日、時分秒を取得

my $regex = '(￥d{4})￥/(￥d{2})￥/(￥d{2})￥s+(￥d{2}):(￥d{2}):(￥d{2})';

if ($datetime =~ /$regex/) {
    $year = $1;
    $month = $2;
    $mday = $3;

    $hour = $4;
    $minute = $5;
    $second = $6;
}

# 正規表現がマッチしなかった場合は警告を表示
else {
    warn "\"$datetime\" is invalid format";
}