class MyApp
  def call(environment) # this method has to be named call
    [200, # the status code
     {"Content-Type" => "text/plain", "Content-length" => "11" }, # headers
     ["Hello world"]] # the body
  end
end

run MyApp.new
