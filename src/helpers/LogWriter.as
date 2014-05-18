// vim: syntax=actionscript
package helpers {
  import flash.events.IOErrorEvent;
  import flash.net.*;
  import flash.utils.*;

  public class LogWriter {
    private static const hostAddress : String = "localhost";
    private static const portAddress : Number = 10929;

    private var _socket: Socket;
    private var _buffer: ByteArray;


    public function LogWriter()
    {
	  _socket = new Socket(hostAddress, portAddress);
	  _socket.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent) : void { trace(e); } );
      _buffer = new ByteArray();

    }

    public function writeLog(str: String) : void {
      _buffer.writeUTF(str);
      if(_socket != null && _socket.connected)
      {
        _socket.writeBytes(_buffer);
        _buffer.length = 0;
      }
    }
  }
}



