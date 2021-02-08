source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#breadcrumb
gem 'breadcrumbs_on_rails'
#adding carrierwave
gem 'carrierwave', '~> 1.3'
gem 'carrierwave-base64'
#add onesignal gem https://github.com/tbalthazar/onesignal-ruby
gem 'one_signal'
#gem 'bootstrap-sass'
#gem 'daru-data_tables'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#insertion du gem roo pour importation des fichiers excel
gem "roo", "~> 2.7.0"
#gestion du qrcode https://github.com/whomwah/rqrcode
gem 'rqrcode'
#for pagination https://github.com/kaminari/kaminari
#gem 'kaminari'
#generation des enregistrements aleatoires
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
#add jquery ui
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Simple_form gem
gem 'simple_form'
#Adding bootstrap
#gem 'bootstrap', '~> 4.0'
#adding jquery-rails
gem 'jquery-rails'
#for xls generation file
#gem 'axlsx_rails'
# using PDF generate with prawn
gem 'prawn', '~> 2.2', '>= 2.2.2'
gem 'prawn-table'
#using font awesome icons
#gem 'material_icons'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
#Using gmap for rails
gem 'gmaps4rails'
gem 'gmaps-rails'
#gestion des authentification et des connexion
gem 'devise'
#Ajout de cancancan
gem 'cancancan', '~> 2.0'
#ajout de sunspot
#gem 'sunspot_rails'
#using underscore js
gem 'underscore-rails', '~> 1.8', '>= 1.8.3'
#user JSON Web Token
gem 'jwt'
#add minimagick gem for cropping images
gem 'mini_magick'
#integration de leaflet from https://github.com/axyjo/leaflet-rails
gem 'leaflet-rails'
#Ajout de la lib D3
gem 'd3-rails'
#integrating chartjs rails
gem 'chart-js-rails'
#gestion des charts pour les statistiques
gem 'chartkick'
#ajout de onesignal
gem 'onsignal'
#installation de groupdate
gem 'groupdate'
#ajout de la gem httparty
gem 'httparty'
#add popper gem
gem 'popper_js', '~> 1.14.3'
#add bootstrap gem
gem 'bootstrap', '~> 4.1.3'
#pour le drag and drop
#gem 'draggable-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rails-erd'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  #gem 'sunspot_solr'
  #gestionnaire des graphique du modele
  #gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
