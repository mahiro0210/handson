=head1 NAME

get_match_line.pl

=head1 SYNOPSIS

perl get_match_line.pl FILE STRING

=head1 DESCRIPTION

このスクリプトは特定の文字列を含む行を取り出します。

=cut

use strict;
use warnings;

my ($file, $match) = @ARGV;

# 使用方法
die "Usage: $0 FILE STRING" unless $file && $match;

# マッチした行を出力
print_match_line($file, $match);

sub print_match_line {
    my ($file, $match) = @_;

    # ファイルのオープン
    open my $fh, '<', $file
      or die qq{Can't open file: "$file": $!};

    # ファイルの読み込み
    while (my $line = <$fh>) {
        
        # マッチした行を出力
        print $line if index($line, $match) > -1;
    }

    # ファイルのクローズ
    close $fh;
}
