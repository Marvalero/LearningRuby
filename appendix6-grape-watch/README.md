## Using watch server

Open a server:
    rackup

Request:
    GET: curl 'http://localhost:9292/watch'
    PUT: curl -X PUT -d time="19:12:00" 'http://localhost:9292/watch'

API Version:
----------------
There is 2 version:
    - v1: There is just an watch
    - v2: You could create watchs and read from them
    - v3: You could create watchs and read from them using a database
    - v4: The same than before but there are a class "Database" that can
      comunicate with the database.
    - v5: The same than before but there are a ApiConfigurator that
      start WatchApi and tell it the object to talk with the database. Database is 2 objects now: ActionDb and DatabaseConector
