# README

Welcome to VideoLearn - the LMS (Learning Management System) of the future.

## Get started

Getting started developing VideoLearn locally is simple. Run the following commands
to create a local Sqlite database and populate it with courses.

```
git clone git@github.com:virtuosolearning/video-learn.git
cd video-learn/
bundle

rails db:create
rails db:migrate
rails db:seed
```

Seeding the database creates a user with the following credentials:

```
email: user@example.com
password: password
```
