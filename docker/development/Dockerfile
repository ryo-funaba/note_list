FROM  ruby:2.5.1-alpine

LABEL maintainer="ryo_funaba<ryo278.0417@gmail.com>"

# 文字コードの設定
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"
    
# ライブラリのインストール(追加したい場合は以下に追記)
RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
	    alpine-sdk \
　　    build-base \
	    bash \
	    imagemagick \
	    jq \
	    less \
	    libgcrypt-dev \
	    libxml2-dev \
        libxslt-dev \
	    mariadb-dev \
	    mysql-client \
	    nodejs \
	    redis \
	    tzdata \
	    wget \
        xvfb \
	    yaml-dev \
        yarn \
        zlib-dev \

#環境変数の設定
ENV APP_HOME="/note" \
    SERVER_PORT=4000

# 実行するディレクトリの指定
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME

RUN npm install -g yarn

RUN gem install bundler
RUN bundle install --jobs=4 --retry=3

ADD . $APP_HOME

EXPOSE $SERVER_PORT