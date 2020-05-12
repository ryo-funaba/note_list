FROM  ruby:2.5.1-alpine
LABEL maintainer="ryo_funaba<ryo278.0417@gmail.com>"
# 文字コードの設定
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"
# ライブラリのインストール(追加したい場合は以下に追記)
RUN apk upgrade && \
    apk add --no-cache \
    bash \
    build-base \
    curl-dev \
    git \
    graphviz \
    imagemagick \
    imagemagick-dev \
    less \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mysql-dev \
    nodejs \
    npm \
    openssl \
    readline \
    readline-dev \
    tar \
    ttf-freefont \
    tzdata \
    udev \
    wget \
    yaml \
    yaml-dev\
    zlib \
    zlib-dev
#パッケージインストール
RUN npm install -g yarn
RUN gem install bundler
RUN gem update
#環境変数の設定
ENV APP_HOME=/note
ENV GEM_HOME=/bundle
#作業ディレクトリ作成
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
#Gemfileルのコピー
ADD Gemfile* $APP_HOME/
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=$GEM_HOME
ADD . $APP_HOME