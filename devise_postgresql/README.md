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
