# frozen_string_literal: true

require_relative "r00lz/version"
require_relative "r00lz/routing"
require_relative "r00lz/util"
require_relative "r00lz/dependencies"

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
  end

  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end
  end
end
