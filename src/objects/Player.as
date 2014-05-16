// vim: syntax=actionscript
package objects {

  public class Player extends Ball {
    private var _points : Number;
    private var _pointCounter : Function;
    private var _logWriter : Function;

    public function Player(t : Function, s : Function)
    {
      _objectType = "Player";
      _pointCounter = t;
      _logWriter = s;
      _points = 0;
      _pointCounter("Score: <b>" + _points.toString() + "</b>");
      _logWriter((new Date()).toString() + " : starting new game");
    }

    override public function collideWith(o : PhysicalObject) : void {
      super.collideWith(o);
      if(o.objectType == "GrowUp") {
        _points++;
      } else {
        _points--;
      }
      _pointCounter("Score: <b>" + _points.toString() + "</b>");
    }

    override public function die() : void {
      super.die();
      _logWriter((new Date()).toString() + " : " + _points.toString());
    }
  }
}


