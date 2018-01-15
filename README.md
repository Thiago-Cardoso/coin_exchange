# coin_exchange
App for conversion of coin

Requirements:
(Docker) -
File dockerfile, this file is in project
Rails 5.1
Ruby: 2.3-slim

Install docker:
curl -fsSL get.docker.com -o get-docker.sh
bash get-docker.sh
sudo usermod -aG docker YOUR_USER_NAME
docker --version

Docker-composer:
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

Gemfile:
gem file is configured:
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'rest-client' (utilizing for consume webservice http://api.fixer.io/latest?base)
Utilizing in group test - for test app with capybara and rspec

  gem 'capybara'
  gem 'rspec-rails', '~> 3.5'

Lib/exchange.rb:  this package is lib that consume webservice

Features for app: Convert of coin , Reverse coin of button
