#!/usr/bin/perl -d:Trace::More

use strict;
use warnings;

# ㈰モジュールの読み込み
use Net::FTP;
use File::Spec;
use File::Copy 'move';
#use lib '/home/action/perl5/lib/perl5';

Devel::Trace::More::output_to('dump_result.txt');

# ㈪ダウンロードしたファイルを保存するディレクトリ
my $download_dir = '/home/action/handson/perl/Chap05/tmp/';

# ㈫ファイルのダウンロード
download_files($download_dir);

# ㈬ファイルを拡張子ごとに分類したディレクトリに移動
categorize_files($download_dir);

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

    # ㈭-8 ファイルの取得
    foreach my $file ($ftp->ls) {
        
        # ㈭-9 指定した拡張子にマッチしない場合は飛ばす
        next unless $file =~ /(\.html|\.gz)$/;
        
        # ㈭-10 ファイルを名前をつけて保存
        $ftp->get($file, File::Spec->catfile($ldir, $file))
          or die qq{Can't get file "$file" } . $ftp->message;
    }
}

# ㈮ファイルを拡張子ごとに分類したディレクトリに移動するサブルーチン
sub categorize_files {

    # ㈮-1 ディレクトリ
    my $dir = shift;
    
    # ㈮-2 すべてのファイルを取得
    my @files = glob(File::Spec->catfile($dir, '*'));
    @files = grep { -f $_ } @files;
    
    # ㈮-3 ファイルを拡張子に応じて分類
    my %exts;
    foreach my $file (@files) {
    
        # ㈮-4 拡張子を取得
        my $ext;
        if ($file =~ /\.([^\.]+)$/) {
            $ext = $1;
        }
        
        # ㈮-5 拡張子名を使ってディレクトリを作成
        my $ext_dir = File::Spec->catfile($dir, $ext);
        mkdir $ext_dir unless -d $ext_dir;
        
        # ㈮-6 ファイルを移動
        move $file, $ext_dir
          or die qq{Can't move file "$file" to "$ext_dir": $!};
    }
}