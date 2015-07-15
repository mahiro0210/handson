use strict;
use warnings;

my $dir = '/var/xxx';

# ファイル一覧（ディレクトリを含む）を取得
my @files = glob("$dir/*");

# CPU使用率のログだけを選別
@files = grep { -f $_ && $_ =~ /cpu_\d{8}.log$/ } @files;
