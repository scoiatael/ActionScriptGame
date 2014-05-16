require('dgram');
var StringDecoder = require('string_decoder').StringDecoder;
var decoder = new StringDecoder('utf8');

var PORT = 10929;
var HOST = 'localhost';

var net = require('net');

var server = net.createServer(function (socket) {
  console.log('Connection from ' + socket.remoteAddress + ': ' + socket.remotePort);
  socket.on('data', function (chunk) {
    console.log(decoder.write(chunk));
  });
});

server.listen(PORT, HOST, 511, function() { 
  console.log('Listening on %j', server.address())
});
