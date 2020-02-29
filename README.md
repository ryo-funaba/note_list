# 環境構築

1:　下記のURLのリポジトリをCloneする。

```
$ git clone https://github.com/ryo-funaba/note_list.git

    # この作業でリモートリポジトリ -> 自分のPC（ローカル）へコピーが完了。 
    
$ cd note

    # noteフォルダへ移動。
    
$ git branch

    # 念の為、ブランチがnoteに移動されたか確認。
```

2:　自分のPC上（ローカルリポジトリ）にて下記の作業を実施


```
$ git checkout debug-test
$ bundle install --path=vendor/bundle
````
```
$ rails db:create # DB作成
$ rails db:migrate # テーブル作成
```
```
$ rails s
```

`http://localhost:3000`にアクセスしてログイン画面が表示されればOK。
