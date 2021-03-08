# DailyTracker

DailyTracker is a simple and effective app for improoving team productivity

## Requirements

DailyTracker requires the following:
- Ruby version 2.7.1
- Rails version 6.0.3.4
- PostgreSQL 9.2 and later

## Install

```ruby
git clone
bundle install
yarn install
```

## System dependencies

## Configuration
- create .env file in the project root directory
- Put this string in the .env-file and replace 'user' and 'password':
```
export DATABASE_URL="postgresql://user:password@localhost/?pool=5&encoding=unicode&timeout=5000"
```
- Put mailer settings in the .env-file:
```
export SENDMAIL_PASSWORD=...
export SENDMAIL_USERNAME=...
export MAIL_HOST=...
export SMTP_HOST=...
export SMTP_PORT=...
```
## Database creation

`rails db:create`

`rails db:migrate`

## Database initialization

`rails db:seed`

## How to run the test suite

`rails spec`

## Services (job queues, cache servers, search engines, etc.)
