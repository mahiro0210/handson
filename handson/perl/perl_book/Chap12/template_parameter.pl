use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;

    # ①テンプレートにパラメータを渡す
    $self->render(country => 'Japan', age => 19);
} => 'entry';

app->start;

__DATA__

@@ entry.html.ep
<html>
    <body>
        <!-- ②パラメータの利用 -->
        Country: <%= $country %><br>
        Age: <%= $age %>
    </body>
</html>
