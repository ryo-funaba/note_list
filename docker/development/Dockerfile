# docker_example_for_rails(Rails/MySQL)
FROM  ruby:2.5.1
LABEL maintainer="ryo_funaba<funaba.ryo.bus@gmail.com>"
# 文字コードの設定
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"
# 環境変数
ENV APP="/note" \
    CONTAINER_ROOT="./" \
    MYSQL_PORT=4306 \
    SERVER_PORT=4000
# ライブラリのインストール(追加したい場合は以下に追記)

# 実行するディレクトリの指定
WORKDIR $APP
COPY Gemfile Gemfile.lock $CONTAINER_ROOT
RUN bundle install
# RAILS_SERVE_STATIC_FILES=trueにすることで、rails serverを起動時にpublic/assetsを読み込む
ENV RAILS_SERVE_STATIC_FILES=true \
    PORT=$SERVER_PORT \
    TERM=xterm
EXPOSE $SERVER_PORT
EXPOSE $MYSQL_PORT