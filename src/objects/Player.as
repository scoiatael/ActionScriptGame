// vim: syntax=actionscript
package objects {
  import events.*;

  public class Player extends Ball {
    private var _points : Number;

    public function Player()
    {
      _objectType = "Player";
      _points = 0;
    }

    override public function collideWith(o : PhysicalObject) : void {
      super.collideWith(o);
      if(o.objectType == "GrowUp") {
        _points++;
      } else {
        _points--;
      }
      dispatchEvent(new ScoreChangeEvent(ScoreChangeEvent.SCORE_CHANGED, _points));
    }

    override public function die() : void {
      super.die();
      dispatchEvent(new ScoreChangeEvent(ScoreChangeEvent.PLAYER_DIED, _points));
    }
  }

}


