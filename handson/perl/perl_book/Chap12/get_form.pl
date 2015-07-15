use Mojolicious::Lite;

# ①フォームのHTMLの描画
get '/' => 'index';

post '/create' => sub {
    my $self = shift;

    # ②POSTメソッドで送信されたパラメータの取得
    my $params = $self->req->body_params->to_hash;
    my $name   = $params->{country};
    my $age    = $params->{age};

    $self->render_text("name:$name; " . "age:$age;");
} => 'create';

app->start;

__DATA__

# ③フォーム送信のためのHTML
@@ index.html.ep
<html>
    <body>
        <form method="post"
              action="<%= url_for('create') %>">
            Country:<input type="text" name="country" ><br>
            Age:<input type="text" name="age" ><br>
            <input type="submit" value="Send" >
        </form>
    </body>
</html>