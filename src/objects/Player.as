// vim: syntax=actionscript
package objects {

  public class Player extends Ball {

    public function Player()
    {
      _objectType = "Player";
    }

    override public function collideWith(o : PhysicalObject) : void {
      super.collideWith(o);
    }
  }
}


