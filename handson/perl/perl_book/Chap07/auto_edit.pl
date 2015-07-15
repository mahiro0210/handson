use strict;
use warnings;
use FindBin;
use File::Spec;
use XML::Simple;
use File::Basename 'fileparse';

# 日付
my $date = shift || '';
die "Usage: $0 yyyymmdd\n" unless $date =~ /^\d{8}$/;

# 設定ファイルの読み込み
my $conf_file = "$FindBin::Bin/auto_edit.xml";
my $xml = XML::Simple->new;
my $conf = $xml->XMLin($conf_file);

# 各ディレクトリ
my $home_dir = $conf->{'home-dir'};
my $log_dir = File::Spec->catfile($home_dir, $conf->{'log-dir'});
my $script_dir = File::Spec->catfile($home_dir, $conf->{'script-dir'});

# ログ
my $edit_logs = $conf->{'edit-logs'};
# 各種類のログの編集
foreach my $type (keys %$edit_logs) {

    # 対象のログの取得
    my $target = File::Spec->catfile($log_dir, $date,
                                     $edit_logs->{$type}->{target});
    my @logs = glob($target);

    # サーバごとのログの編集
    foreach my $log (@logs) {

        # スクリプト
        my $script = File::Spec->catfile($script_dir,
                                         $edit_logs->{$type}->{script});

        # 出力ファイル
        my $outdir = File::Spec->catfile($log_dir, $date,
                                         $edit_logs->{$type}->{to});
        my ($outfile_base, $outfile_ext) = (fileparse($log, qr/\..+$/))[0, 2];
        my $outfile = File::Spec->catfile($outdir,
                                          "${outfile_base}_edit$outfile_ext");

        # コマンドの実行
        my $command = "perl $script $log > $outfile";
        system($command) == 0
            or die qq{system "$command" failed: $?};
    }
}
