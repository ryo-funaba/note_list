# note List
![402da8b5e022b1b51631f3d4bdc1230a](https://user-images.githubusercontent.com/59598693/83468013-87594880-a4b6-11ea-9604-13f7fa04fdc6.png)

## 1. サービス概要
note Listは[note](https://note.com/)専用の**レビュー投稿サイト**です。<br>

コンテンツ配信プラットフォームである「note」にはレビュー機能がありません。<br>
そのため有料noteを購入しようか迷った時は、口コミが無くて少し不安になってしまいます。<br>
実際、商品を購入する際にレビューや口コミを参考にする人は**90%以上**と言われております。<br>

note Listは購入時の不安を解決し、少しでも有益な口コミを広めるために生まれました。

## 2. 技術スタック
### 言語・フレームワーク
- Ruby 2.6.5
- Ruby on Rails 5.2.4
### 開発環境
- Docker
- MySQL
### テスト環境
- RSpec
- CircleCI（自動テスト）
### 本番環境
- AWS（EC2・RDS・S3・Route53・ALB・ACM）
- Unicorn（アプリケーションサーバー）
- Nginx（Webサーバー）

## 3. インフラ構成図
![note_list_aws](https://user-images.githubusercontent.com/59598693/83466728-f5037580-a4b2-11ea-96dc-9ae2934c7473.png)


## 4d. その他機能一覧
- ユーザー登録機能（devise）
- ログイン・ログアウト機能（devise）
- 管理ユーザー機能（devise）
- ユーザー画像アップロード機能（Active Storage）
- レビュー投稿機能（スクレイピング : Selenium）
- ランキング表示機能
- 検索機能
- ページネーション機能（kaminari）