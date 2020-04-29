module Inatra
  class << self
    def routes(&block)
      @route = {}
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase
      path = env['PATH_INFO']
    p @route
      @route[method][path].call
    end

    def method_missing(method_name, *args, &block)
      method = method_name.to_s
      path = args.first
      @route[method] = {}
      @route[method][path] = block
    end
  end
end
