module Rack::Authorize
  class Rule
    attr_reader :method, :path, :block

    def initialize(method, path, block)
      @method = method.to_sym
      @path = path
      @block = block
    end

    def relevant?(method, path)
      method = method.downcase.to_sym
      if @method == :all
        @path == :all || path == @path
      elsif @path == :all
        @method == :all || method == @method
      else
        (@method == :all && @path == :all) ||
        (method == @method && path == @path)
      end
    end
  end
end
