```
1. install nodejs 8.9.4

2. install npm dependencies
	$ npm install

3. run docker container with mosquitto
	$ docker-compose up --force-recreate --build

4. execute subscriber_invalid.js
	$ node subscriber_invalid.js

5. wait a few seconds e.g. 5 seconds

6. execute subscriber_valid.js in another shell
	$ node subscriber_valid.js

after few seconds or 2-3 minutes you should see:
mosquitto_1  | Assertion failed: pollfds[context->pollfd_index].fd == context->sock (loop.c: loop_handle_reads_writes: 488)
```
