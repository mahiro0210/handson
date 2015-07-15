use strict;
use warnings;

# Mojolicious::Liteの読み込み
use Mojolicious::Lite;

get '/search' => sub {
    my $self = shift;

    # クエリ文字列に含まれるパラメータをハッシュのリファレンスとして取得
    my $params = $self->req->params->to_hash;
    my $language = $params->{lang};
    my $text = $params->{text};

    $self->render_text("language:$language; " . "text:$text;");
};

# Webアプリケーションの開始
app->start;

