source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'rails-ujs'
# Use sqlite3 as the database for Active Record
gem 'rails-assets-coverflow', source: 'http://insecure.rails-assets.org'

gem 'bcrypt', :platform => :ruby
# Devise auth
gem 'devise'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-script-source', '1.8.0'
gem 'font-awesome-sass', '~> 4.7.0'
gem "therubyracer", ">= 0.11.0", :group => :assets, :platform => :ruby, :require => "v8"
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'execjs'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'


gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "3.1-stable"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# gem bootstrap
gem 'rake'
gem 'ancestry'

gem 'acts_as_votable'

gem 'bootstrap', '~> 4.0.0.alpha6'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use paperclip
gem 'paperclip'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'sqlite3'
end

group :production do

	gem 'sqlite3'
	gem 'rails_12factor'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
