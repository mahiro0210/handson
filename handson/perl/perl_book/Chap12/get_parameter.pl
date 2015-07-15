use warnings;

# Mojolicious::Liteの読み込み
use Mojolicious::Lite;

get '/entry/:date' => sub {
    my $self = shift;

    my $stash = $self->stash;
    my $date = $stash->{date};

    $self->render_text($date);
};

# Webアプリケーションの開始
app->start;
