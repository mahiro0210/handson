use strict;
use warnings;

# ①Mojolicious::Liteの読み込み
use Mojolicious::Lite;

# ②URLとそれに対応する処理
get '/' => sub {
    # ③コントローラオブジェクトの取得
    my $self = shift;

    # ④テキストの描画
    $self->render_text('Hello!');
};

# ⑤Webアプリケーションの開始
app->start;
