use Mojolicious::Lite;

get '/' => sub {
    my $self = shift;

    # �@テンプレートにパラメータを渡す
    $self->render(country => 'Japan', age => 19);
} => 'entry';

app->start;

__DATA__

@@ entry.html.ep
<html>
    <body>
        <!-- �Aパラメータの利用 -->
        Country: <%= $country %><br>
        Age: <%= $age %>
    </body>
</html>
