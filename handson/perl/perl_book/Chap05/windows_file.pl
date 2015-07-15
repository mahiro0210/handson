use utf8;
use Encode 'encode';
use File::Copy 'copy';

# 日本語を含むファイル名
my $from = 'c:/sample/テキストファイル.txt';
my $to = 'c:/sample/テキストファイル_edit.txt';

# バイト文字列に変換
my $enc = 'cp932';
my $from_b = encode($enc, $from);
my $to_b = encode($enc, $to);
copy($from_b, $to_b)
    or die qq{Can't move "$from_b" to "$to_b": $!};
