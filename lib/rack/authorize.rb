require "rack/authorize/version"


require "rack/authorize/ability"
require "rack/authorize/rule"
require "rack/authorize/authorizer"
module Rack
  module Authorize
    def self.new(app, ability_proc)
      Authorizer.new(app, ability_proc)
    end
  end
end