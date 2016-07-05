module Detectify
  class Railtie < Rails::Railtie
    initializer 'detectify' do |app|
      app.config.middleware.use 'Detectify::Middleware'
    end
  end
end
