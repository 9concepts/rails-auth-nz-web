# Devise 素振り

```bash
# Run Database
skaffold dev -f skaffold/deps.yaml  --port-forward
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

### ポートフォワードされない　

Ubuntu 22.04 ではポートフォワードされるが、macOS では下記の状態でポートフォワードされなかった。

```bash
$ skaffold dev -f deps.yaml --port-forward -w=
Listing files to watch...
Generating tags...
Checking cache...
Tags used in deployment:
Starting deploy...
Helm release devise-postgresql-db not installed. Installing...
NAME: devise-postgresql-db
LAST DEPLOYED: Fri Dec 16 23:32:14 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
Waiting for deployments to stabilize...
Deployments stabilized in 19.747439ms
Press Ctrl+C to exit
Watching for changes...
```

ブラウザから Rails アプリにアクセスすると下記のエラーになる。

```bash
$ kubectl port-forward devise-postgresql-db-74fbc94df-ztw7m 5432:18000
Forwarding from 127.0.0.1:5432 -> 18000
Forwarding from [::1]:5432 -> 18000
Handling connection for 5432
E1216 23:41:21.963790   47741 portforward.go:400] an error occurred forwarding 5432 -> 18000: error forwarding port 18000 to pod 802bbf9ddcbb81dd45330e4d350cfac881c28ba8afc761965d825c5faa080f4c, uid : exit status 1: 2022/12/16 14:41:21 socat[26041] E connect(17, AF=2 127.0.0.1:18000, 16): Connection refused
```

https://github.com/kubernetes/kubectl/issues/1169 issue は見つけたけど解決策不明。

`kubectl port-forward` でポートフォワードしたら接続できた。

```bash
$ kubectl port-forward --address 0.0.0.0 devise-postgresql-db-74fbc94df-pmsgt 18000:5432
Forwarding from 0.0.0.0:18000 -> 5432
Handling connection for 18000
Handling connection for 18000
```
