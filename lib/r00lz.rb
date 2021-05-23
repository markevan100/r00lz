# frozen_string_literal: true

require_relative "r00lz/version"

module R00lz
  class Error < StandardError; end

  class App
    def call(env)
      begin
        klass, action = controller_and_action(env)
        text = klass.new(env).send(action)
        [200,
          { 'Content-Type' => 'text/html' },
          [text]
        ]
      rescue
        [200,
          { 'Content-Type' => 'text/html' },
          ['Sorry! R00lz could not locate the page you requested. Wish this were working better!']
        ]
      end
    end

    def controller_and_action(env)
      return [Object.const_get('HomeController'), 'index'] if env['PATH_INFO'] == '/'

      _, controller, action, after = env['PATH_INFO'].split('/')
      controller = controller.capitalize + 'Controller'
      [Object.const_get(controller), action]
    end
  end

  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end
  end
end
