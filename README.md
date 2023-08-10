# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
## Deployment

### One Click

Use the button below to deploy ClickHouse on Render.

[![Deploy to Render](http://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

* ...

* By GR
 Docker doc 
 docker build -t div:1.2 .
 docker run -p 3000:3000 -v "$(pwd)":/cv_creater div:1.2    \\ it run server for current dir file 
 docker run -p 3000:3000 -it -v "$(pwd)":/cv_creater div:1.2  bash  \\ docker bash