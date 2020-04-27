module Inatra
  class << self
    def routes(&block)
      @route = {}
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].to_s.downcase
      path = env['PATH_INFO']
      @route[method][path].call
    end

    def method_missing(method_name, *arg, &block)
      method = method_name.to_s
      path = arg.first
      @route[method] = {}
      @route[method][path] = block
    end
  end
end
