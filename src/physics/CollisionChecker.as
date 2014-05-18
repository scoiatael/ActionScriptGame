// vim: syntax=actionscript
package physics {
  import away3d.core.base.*;
  import away3d.containers.*;

  import objects.*;

  public class CollisionChecker {
    public static function distanceBetween(a : Object3D, b : Object3D) : Number {
      return length3D(a.x,a.y,a.z,b.x,b.y,b.z);
    }

    private static function length3D(a1: Number, b1: Number, c1: Number,
                                    a2: Number, b2: Number, c2: Number) : Number {
      return Math.sqrt(Math.pow(a2 - a1, 2) + Math.pow(b2 - b1, 2) + Math.pow(c2 - c1, 2));
    }

    public static function checkCollisionsS(_objects : /*PhysicalObjects*/ Scene) : void
    {
      var oa : PhysicalObject;
      var ob : PhysicalObject;
      for(var i : Number = 0; i < 10; i++) {
        _objects.eachChild(function(oa : PhysicalObject, a : Number) : void {
            if(oa.radius > 0) {
              _objects.eachChild(function(ob : PhysicalObject, b : Number) : void {
              if(a != b && oa.isAlive() && ob.isAlive() && 
                  oa.radius + ob.radius >= distanceBetween(oa, ob)) {
                trace(a,b);
                oa.collideWith(ob);
                ob.collideWith(oa);
              }
            });
          }
        });
      }
    }
    public function CollisionChecker()
    {
    }

    public function checkCollisions(_o : Scene) : void
    {
      checkCollisionsS(_o);
    }
  }
}


