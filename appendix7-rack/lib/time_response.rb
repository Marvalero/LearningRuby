class TimeResponse
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, response = @app.call(env)
    stop = Time.now
    puts "status:#{status}, headers:#{headers}, <!-- Response Time: #{stop - start} -->\n #{response.to_s}"
    [status,headers,[ "status: #{status}", " - Response Time: #{stop-start}"]]
  end
end
