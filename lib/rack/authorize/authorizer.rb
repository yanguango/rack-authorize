module Rack::Authorize
  class Authorizer
    def initialize(app, &block)
      @app = app
      @block = block
    end

    def call(env)
      method = env["REQUEST_METHOD"]
      path = env["PATH_INFO"]
      return [403, {}, ["Access Forbidden"]] unless @block.call(method, path)
      @app.call(env)
    end
  end
end
