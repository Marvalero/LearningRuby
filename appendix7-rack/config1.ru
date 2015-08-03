# run an app
run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['return value \n']] }
