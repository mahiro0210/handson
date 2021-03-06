use strict;
use warnings;

# �@Mojolicious::Liteの読み込み
use Mojolicious::Lite;

# �AURLとそれに対応する処理
get '/' => sub {
    # �Bコントローラオブジェクトの取得
    my $self = shift;

    # �Cテキストの描画
    $self->render_text('Hello!');
};

# �DWebアプリケーションの開始
app->start;
