# README

This README would normally document whatever steps are necessary to get the
application up and running.

**Please, do this actions step by step and all will be right!**
* System dependencies
```bash
sudo apt-get install git postgresql-9.1 postgresql-server-dev-9.1 curl
```
* Database initialization
```bash
sudo service postgresql start
sudo su postgres
psql
```
```SQL
CREATE USER "brainwo" WITH PASSWORD 'brainwopwd';
ALTER USER "brainwo" CREATEDB;
\q
```
```bash
exit
```
* Ruby version. For more info look [here](https://rvm.io/)
```bash
echo progress-bar >> ~/.curlrc
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.1.0
rvm gemset use 2.1.0@brainwo --create
```
* Configuration
```bash
git clone https://github.com/cat-in-the-dark-wood/brainwo.git
cd brainwo
rvm gemset use 2.1.0@brainwo
bundle
```
* Database creation
```bash
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```
* Run application
```bash
bundle exec rails s
```
* How to run the test suite
```bash
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:migrate RAILS_ENV=test
rspec spec/
```
* Create new deployment on heroku. Read more  [here](https://devcenter.heroku.com/articles/getting-started-with-rails4)
```bash
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku login
cd brainwo
heroku create
git push heroku master
heroku open
```
* Deploy on exists heroku instance
```bash
git remote add heroku git@heroku.com:APPNAME.git
git push heroku master
```
