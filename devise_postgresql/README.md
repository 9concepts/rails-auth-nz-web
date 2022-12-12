# Devise 素振り

```bash
# Run Database
docker compose up
# Run server
bin/dev
```


## 足跡

```bash
bundle init
bundle add rails
bundle exec rails new . --css=bootstrap --database=postgresql --skip-jbuilder
```

```bash
bundle exec rails generate devise:install
bundle exec rails g model user
bundle exec rails db:migrate
```

```bash
# Users::SessionsController の生成
bundle exec rails g devise:controllers users -c=sessions 
```

[[Rails] devise sign_in/sign_outのデフォルトルーティングをカスタマイズしてlogin/logoutにする](https://tech.mof-mof.co.jp/blog/devise-custom-routes/)

## 疑問

- `devise_scope` は何をしているのか

## Troubleshooting
