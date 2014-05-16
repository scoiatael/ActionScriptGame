// vim: syntax=actionscript
package objects {

    public class Player extends Ball {

        public function Player() {
        }
        
        override public function collideWith(o : PhysicalObject) : void {
//          var l : * = forwardVector.clone();
          super.collideWith(o);
//          lookAt(l);
        }
    }
}

