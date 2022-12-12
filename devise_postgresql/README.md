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

### `Unknown action`

```bash
Could not find devise mapping for path "/login".
This may happen for two reasons:
1) You forgot to wrap your route inside the scope block. For example:
devise_scope :user do
get "/some/route" => "some_devise_controller"
end
2) You are testing a Devise controller bypassing the router.
If so, you can explicitly tell Devise which mapping to use:
@request.env["devise.mapping"] = Devise.mappings[:user]
```

下記を加えると直った。
ちなみに、下記がない場合、サーバーを再起動しない限りは動き続ける。
削除後にサーバーを再起動すると件のエラーになる。原因不明。

```diff
diff --git a/devise_postgresql/config/routes.rb b/devise_postgresql/config/routes.rb
index b413ad4..280a50f 100644
--- a/devise_postgresql/config/routes.rb
+++ b/devise_postgresql/config/routes.rb
@@ -1,4 +1,5 @@
 Rails.application.routes.draw do
+  devise_for :users, skip: [:sessions]
   root "top#index"
 
   devise_scope :user do
```
