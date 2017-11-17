# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
<<<<<<< HEAD
=======

# extra stylesheets
Rails.application.config.assets.precompile += %w( hotel.css )
Rails.application.config.assets.precompile += %w( static.css )
Rails.application.config.assets.precompile += %w( style.css )

# extra stylesheets within the custom sub-folder
Rails.application.config.assets.precompile += %w( custom/_blog_post-custom.css )
Rails.application.config.assets.precompile += %w( custom/_form-custom.css )
Rails.application.config.assets.precompile += %w( custom/_forms-custom.css )
Rails.application.config.assets.precompile += %w( custom/_sidebar-custom.css )
Rails.application.config.assets.precompile += %w( custom/_timeline-custom.css )

# extra Javascript files
Rails.application.config.assets.precompile += %w( cable.js )
Rails.application.config.assets.precompile += %w( core.min.js )
Rails.application.config.assets.precompile += %w( html5shiv.min.js )
Rails.application.config.assets.precompile += %w( pointer-events.min.js )
Rails.application.config.assets.precompile += %w( script.js )


>>>>>>> 579008f5a1fa7d91706bb5a73fe21633a4510a94
