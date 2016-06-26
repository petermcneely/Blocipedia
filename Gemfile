source 'https://rubygems.org'
ruby '2.2.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

group :production do
   gem 'pg'
   gem 'rails_12factor'
end

group :development do
   gem 'sqlite3'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'figaro'
gem 'pry'
gem 'devise'
gem 'pundit'
gem 'stripe'
gem 'redcarpet'
gem 'haml'
gem 'friendly_id', '~> 5.1.0'
#gem 'epiceditor', '~> 0.2.2' #https://github.com/AJAlabs/EpicEditor
gem 'epic_editor', :path => 'EpicEditor'

group :development, :test do
   gem 'byebug'
   #gem 'web-console', '~> 2.0' #rspec complains about this being defined in the test environment. What's it for?
   gem 'spring'
   gem 'rspec-rails'
   gem 'shoulda'
   gem 'faker'
   gem 'factory_girl_rails'
   gem 'better_errors'
   gem "binding_of_caller"
end
