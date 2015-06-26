require "rack/authorize/version"


require "rack/authorize/ability"
require "rack/authorize/rule"
require "rack/authorize/authorizer"
module Rack
  module Authorize
    def self.new(app, &block)
      Authorizer.new(app, &block)
    end
  end
end