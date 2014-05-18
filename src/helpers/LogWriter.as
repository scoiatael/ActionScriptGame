// vim: syntax=actionscript
package helpers {
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
      _buffer = new ByteArray();

    }

    public function writeLog(str: String) : void {
      _buffer.writeUTF(str);
      if(_socket.connected)
      {
        _socket.writeBytes(_buffer);
        _buffer.length = 0;
      }
    }
  }
}



