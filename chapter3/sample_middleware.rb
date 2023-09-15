# 3-2-2 Rackの基本。p135
class SimpleMiddleware
  def initialize(app)
    puts "*" * 50
    puts "#{self.class} initialize(app = #{app.class})"
    puts "*" * 50
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    return [status, headers, body]
  end
end