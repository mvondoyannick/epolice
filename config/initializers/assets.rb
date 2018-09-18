# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( bulma.min.css )
Rails.application.config.assets.precompile += %w( bulma.css.map )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( bulma.js )
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
# ==================================================================================
Rails.application.config.assets.precompile += %w( bootstrap-4.1/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap-4.1/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-4.1/popper.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-progressbar/bootstrap-progressbar.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-progressbar/bootstrap-progressbar.min.css )
Rails.application.config.assets.precompile += %w( chartjs/Chart.bundle.min.js )
Rails.application.config.assets.precompile += %w( circle-progress/circle-progress.js )
Rails.application.config.assets.precompile += %w( countdown/countdowntime.js )
Rails.application.config.assets.precompile += %w( countdown/jquery.countdown.min.js )
Rails.application.config.assets.precompile += %w( countdown/moment.min.js )
Rails.application.config.assets.precompile += %w( countdown/moment-timezone.min.js )
Rails.application.config.assets.precompile += %w( countdown/moment-timezone-with-data.min.js )
Rails.application.config.assets.precompile += %w( counter-up/circle-progress.js )
Rails.application.config.assets.precompile += %w( css-hamburgers/circle-progress.js )
Rails.application.config.assets.precompile += %w( lightbox2/circle-progress.js )
Rails.application.config.assets.precompile += %w( mdi-font/circle-progress.js )
Rails.application.config.assets.precompile += %w( perfect-scrollbar/circle-progress.js )
Rails.application.config.assets.precompile += %w( progressbar/circle-progress.js )
Rails.application.config.assets.precompile += %w( select2/circle-progress.js )
Rails.application.config.assets.precompile += %w( slick/circle-progress.js )
Rails.application.config.assets.precompile += %w( smk-accordion/circle-progress.js )
Rails.application.config.assets.precompile += %w( sweetalert/circle-progress.js )
Rails.application.config.assets.precompile += %w( vector-map/circle-progress.js )
Rails.application.config.assets.precompile += %w( wow/circle-progress.js )
Rails.application.config.assets.precompile += %w( jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js )