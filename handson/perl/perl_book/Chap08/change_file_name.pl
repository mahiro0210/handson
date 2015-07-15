use strict;
use warnings;

# ファイル名
my $file_old = 'xxx.txt';

# 拡張子を分離
$file_old =~ /^(.+)(\.[^\.]+)$/;
my $basename = $1;  # xxx
my $ext      = $2;  # .txt

# 新しいファイル名
my $file_new = "${basename}_edit.txt";
