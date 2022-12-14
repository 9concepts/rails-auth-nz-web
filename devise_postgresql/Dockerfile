FROM node:18.12-alpine AS node
WORKDIR /app
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn install

FROM ruby:3.1.3
RUN apt-get update && apt-get install -y build-essential libpq-dev
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
