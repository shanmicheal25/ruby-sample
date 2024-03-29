source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'haml-rails', '~> 2.0'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false

# Create the bootstrap UI
gem 'bootstrap', '~> 5.1.0'
gem 'simple_form'
gem 'jquery-rails'

# Get the language list in the dropdown.
gem 'language_list', '~> 1.2', '>= 1.2.1'

# for user authentication
gem 'devise', '~> 4.8'

# for user authoriation 
gem 'pundit'

# for pagnation
gem 'kaminari'
gem 'bootstrap5-kaminari-views'

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rails-controller-testing'
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'

  # Add brakeman gem for security reason, static analysis tool
  gem 'brakeman'
  gem 'bundler-audit'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'faker'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
