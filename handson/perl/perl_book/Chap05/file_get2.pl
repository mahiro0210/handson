use strict;
use warnings;

# ㈰モジュールの読み込み
use Net::FTP;
use File::Spec;
use File::Copy 'move';

use lib '/home/action/perl5/lib/perl5';

# ㈪ダウンロードしたファイルを保存するディレクトリ
my $download_dir = '/home/action/handson/perl/Chap05/tmp/';

# ㈫ファイルのダウンロード
download_files($download_dir);

# ㈬ファイルを拡張子ごとに分類したディレクトリに移動
#categorize_files($download_dir);

# ㈭ファイルをダウンロードするサブルーチン
sub download_files {

    # ㈭-1 ローカルディレクトリ
    my $ldir = shift;

    # ㈭-2 ホスト名
    my $host = 'ftp.riken.jp';

    # ㈭-3 FTPサーバに接続
    my $ftp = Net::FTP->new($host)
      or die qq{Can't connect to "$host": $@};

    # ㈭-4 FTPサーバへログイン
    $ftp->login('anonymous')
      or die qq{Can't login "$host" } . $ftp->message;

    # ㈭-5 ダウンロードしたファイルを保存するディレクトリの作成
    mkdir $ldir unless -d $ldir;

    # ㈭-6 リモートディレクトリ
    my $rdir = '/lang/CPAN/';

    # ㈭-7 リモートディレクトリの移動
    $ftp->cwd($rdir)
      or die qq{Can't change directory "$rdir" } . $ftp->message;

    $ftp->get("README", $ldir . "README")
          or die qq{Can't get file "README" } . $ftp->message; 
}
