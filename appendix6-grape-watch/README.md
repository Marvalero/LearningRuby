## Using watch server

Open a server:
------------
    rackup

Request:
------------
    GET: curl 'http://localhost:9292/watch'
    PUT: curl -X PUT -d time="19:12:00" 'http://localhost:9292/watch'
