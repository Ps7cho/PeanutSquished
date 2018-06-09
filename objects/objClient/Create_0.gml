/// @description 

/// create the Client
var type = network_socket_tcp;
var ipaddress = "dev-test.3ragaming.com";
var ipaddres = "76.187.20.162";
var localhost = "192.168.1.65";
var port = 6112;


socket = network_create_socket(type);
isConnected = network_connect(socket, localhost, port);

var size = 256;
var type = buffer_fixed;
var alignment = 1;
buffer = buffer_create(size, type, alignment);
bufferLarge = buffer_create(1024, type, alignment);

clientmap = ds_map_create();

Ping = 2;
MyID = -1;

global.seconds_passed = delta_time/1000000;

globalvar debug ;
debug = true;

alarm[0] = 60;

//network events as enumerators
enum networkEvents {
	ping,
	input,
	shoot,
	hit,
	bullet,
	position,
	building,
	buildingDestroy,
	connect,
	initialConnect,
	disconnect
}

enum inputs {
	d = 0,
	w = 1,
	a = 2,
	s = 3
}

