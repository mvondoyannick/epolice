# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
#Rails.application.config.assets.precompile += %w( bulma.min.css )
#Rails.application.config.assets.precompile += %w( bulma.css.map )
#Rails.application.config.assets.precompile += %w( admin.css )
#Rails.application.config.assets.precompile += %w( bulma.js )
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( inbox.css )
Rails.application.config.assets.precompile += %w( email.js )
Rails.application.config.assets.precompile += %w( moment.min.js )
Rails.application.config.assets.precompile += %w( faker.min.js )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( vue.min.js )
Rails.application.config.assets.precompile += %w( jquery-3.3.1.min.js)
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( cards.css )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.ttf )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.woff )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.woff2 )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.svg )
Rails.application.config.assets.precompile += %w( gmaps.js )
Rails.application.config.assets.precompile += %w( theme.css )