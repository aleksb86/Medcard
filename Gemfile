source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.7'
gem 'knock', '~> 2.1', '>= 2.1.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.2.rc2'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'pry', '~> 0.12.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry-remote'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.77.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
