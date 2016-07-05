module Detectify
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request  = Rack::Request.new(env)
      detector = Detector.new(request.url)

      env['Detectify-Entity'] = detector.detect

      @app.call(env)
    end
  end
end
