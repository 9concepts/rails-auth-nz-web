# README

Devise で認証をして Pundit で認可をする

- [x] email と パスワードでサインアップできる
- [ ] アカウント発行メールからアカウントを有効化できる
- [ ] 上記について、権限を持つユーザーだけがアカウント発行できる
- [x] email と パスワードでサインインできる
- [ ] パスワードを変更できる
- [x] サインアウトできる

## Development

```bash
# Run tests
bundle exec rspec
```

## Troubleshootings

### Devise が Rails 7 の turbo に非対応

現在 Devise が Rails 7 の turbo に完全対応していないので、フォームで turbo を無効にする必要がある。
そうしないと、`<body>` 要素の末尾に無限にエラーメッセージが追加されていく地獄になる。

```ruby
= form_for(@user, as: resource_name, url: session_path(resource_name), data: { turbo: false }) do |f|
```

さらに、`method: :delete` ではなく以下のようにする必要がある。

```ruby
= link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete }
```

> 4.8.1 - 2021-12-16
enhancements
Add support for Rails 7.0. Please note that Turbo integration is not fully supported by Devise yet.
> https://github.com/heartcombo/devise/blob/main/CHANGELOG.md

#### 参考

- [Rails 7.0 + Ruby 3.1でゼロからアプリを作ってみたときにハマったところあれこれ - Qiita](https://qiita.com/jnchito/items/5c41a7031404c313da1f#devise%E3%81%8Cturbo%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%97%E3%81%A6%E3%81%84%E3%81%AA%E3%81%84)
