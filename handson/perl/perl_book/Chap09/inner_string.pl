use strict;
use warnings;
use utf8;

use Encode 'decode';

# コマンドライン引数（UTF-8バイト文字列）
my $byte_str = shift;

# UTF-8バイト文字列を内部文字列にデコード
my $internal_str = decode('UTF-8', $byte_str);

# 文字列の長さ
my $length = length $internal_str;
print "length: $length\n";

# 文字列リテラル
my $internal_str2 = 'こん';

# 正規表現
if ($internal_str =~ /$internal_str2/) {
    print "Match!\n";
}