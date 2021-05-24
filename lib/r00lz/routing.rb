module R00lz
  class App
    def controller_and_action(env)
      return [Object.const_get('HomeController'), 'index'] if env['PATH_INFO'] == '/'

      _, controller, action, after = env['PATH_INFO'].split('/')
      controller = controller.capitalize + 'Controller'
      [Object.const_get(controller), action]
    end
  end
end
