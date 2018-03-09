var mqtt = require('mqtt')
var client  = mqtt.connect({
	hostname: 'localhost',
	port: 9001,
	protocol: 'ws',
	username: 'admin',
	password:'test',
	rejectUnauthorized: false
});

client.on('connect', () => {
	console.log('connected');
	client.subscribe('some/topic');
});

client.on('error', (err) => {
	console.log('error');
	console.log(err);
});

client.on('reconnect', () => {
	console.log('reconnect');
});

client.on('close', () => {
	console.log('close');
});

client.on('message', function (topic, message) {
	console.log('message');
 	console.log(message.toString())
});
