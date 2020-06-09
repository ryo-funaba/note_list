# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.14.0'

# Capistranoのログの表示に利用する
set :application, 'note_List'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:ryo-funaba/note_list.git'

set :branch, 'master'

set :deploy_to, '/var/www/projects/note_list'

# シンボリックリンクをはるファイル
set :linked_files, fetch(:linked_files, []).push('config/master.key', 'config/database.yml')

# シンボリックリンクをはるフォルダ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョンの個数
set :keep_releases, 2

set :rbenv_ruby, '2.6.5'

#出力するログのレベル。
set :log_level, :debug

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end