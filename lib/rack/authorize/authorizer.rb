Bundler.require

module Rack::Authorize
  class Authorizer
    def initialize(app, ability_proc)
      @app = app
      @ability_proc = ability_proc
    end

    def call(env)
      method = env["REQUEST_METHOD"]
      path = env["PATH_INFO"]
      ability = @ability_proc.call
      p ability
      return [403, {}, ["Access Forbidden"]] unless ability.can?(method, path)
      @app.call(env)
    end
  end
end