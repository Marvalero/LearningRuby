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
