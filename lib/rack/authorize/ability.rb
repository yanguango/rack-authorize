module Rack::Authorize
  module Ability
    def can(method, path, &block)
      rules << Rule.new(method, path, block)
    end

    def can?(method, path)
      matched_rules(method, path).each do |rule|
        return rule.block.call if rule.block
        return true
      end
      false
    end

    [:get, :put, :post, :delete, :head, :options, :patch, :all].each do |method|
      define_method("can_#{method}".to_sym) do |path, &block|
        can(method, path, &block)
      end

      define_method("can_#{method}?".to_sym) do |path|
        can?(method, path)
      end
    end

    private
    def rules
      @rules ||= []
    end

    def matched_rules(method, path)
      rules.select {|rule| rule.relevant?(method, path)}
    end
  end
end
