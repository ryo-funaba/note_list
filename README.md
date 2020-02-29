# 環境構築

**1: 下記のURLのリポジトリをCloneする。**

```
$ git clone https://github.com/ryo-funaba/note_list.git

    # この作業でリモートリポジトリ -> 自分のPC（ローカル）へコピーが完了。 
    
$ cd note_list

    # note_listフォルダへ移動。
    
$ git branch

    # 念の為、ブランチの確認。現在のブランチは master
```

**2:自分のPC上（ローカルリポジトリ）にて下記の作業を実施**

```
$ git checkout account_edit

$ bundle install
```

※bundle installした時に、mysql2のGemがインストールされない可能性があります。

その場合は、sqlite3に変更して対応。

Gemfile
```
# gem 'mysql2', '0.5.2' //ここをコメントアウト。代わりに下記を記載。
*gem 'sqlite*
```

config/database.yml
```
default: &default
  // adapter: mysql2 ここをコメントアウト。代わりに下記を記載。
  *adapter**: sqlite3*
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  socket: /var/lib/mysql/mysql.sock
```

**3:DBの作成 〜 ローカル上での確認**
```
$ rails db:create # DB作成
$ rails db:migrate # テーブル作成
```
```
$ rails s
```

`http://localhost:3000`にアクセスしてログイン画面が表示されればOK。


