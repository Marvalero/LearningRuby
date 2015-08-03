## Examples of rack applications

  - config1.ru: running basic application that return a value
  - config2.ru: running an application that as the method call(env)
  - config3.ru: running an middware rack that check autentification,
    show the env var and run an application
  - config4.ru: running an rack application with a middware
    (lib/time_response) that show the response time. This middleware is tested with an rspec test.

Use: rackup nameconfigfile

