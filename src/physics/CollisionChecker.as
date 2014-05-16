// vim: syntax=actionscript
package physics {
  import away3d.core.base.*;
  import away3d.containers.*;

  import objects.PhysicalObject;
  public class CollisionChecker {
    public static function length3D(a1: Number, b1: Number, c1: Number,
                                    a2: Number, b2: Number, c2: Number) : Number {
      return Math.sqrt(Math.pow(a2 - a1, 2) + Math.pow(b2 - b1, 2) + Math.pow(c2 - c1, 2));
    }

    public static function checkCollisionsS(_objects : /*PhysicalObjects*/ ObjectContainer3D) : void
    {
      var oa : PhysicalObject;
      var ob : PhysicalObject;
      for(var i : Number = 0; i < 10; i++) {
        for (var a : Number = 0; a < _objects.numChildren; a++)
        {
          oa = PhysicalObject(_objects.getChildAt(a));
          for (var b : Number = 0; b < _objects.numChildren; b++) {
            ob = PhysicalObject(_objects.getChildAt(b));
            if(a != b && oa.radius + ob.radius >= length3D(oa.x,oa.y,oa.z,ob.x,ob.y,ob.z)) {
              trace(a,b);
              oa.collideWith(ob);
              ob.collideWith(oa);
            }
          }
        }
      }
    }
    public function CollisionChecker()
    {
    }

    public function checkCollisions(_o : ObjectContainer3D) : void
    {
      checkCollisionsS(_o);
    }
  }
}


