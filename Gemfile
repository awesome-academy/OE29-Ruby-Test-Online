source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "bcrypt", "3.1.13"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap", "~> 5.0.0.alpha1"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass"
gem "cocoon"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "2.1.2"
gem "figaro"
gem "i18n-js"
gem "image_processing", "1.9.3"
gem "jbuilder", "~> 2.7"
gem "jquery-rails"
gem "kaminari"
gem "mysql2"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3.2"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "sprockets-rails", "~>3.2.2"
gem "turbolinks", "~> 5.2.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry"
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development, :test do
  gem "rspec-rails", "~> 4.0.1"
end
