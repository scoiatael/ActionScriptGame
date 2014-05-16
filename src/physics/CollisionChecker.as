// vim: syntax=actionscript
package physics {
  import away3d.core.base.*;

  import objects.Ball;
  public class CollisionChecker {
    public static function length3D(a1: Number, b1: Number, c1: Number,
                                    a2: Number, b2: Number, c2: Number) : Number {
      return Math.sqrt(Math.pow(a2 - a1, 2) + Math.pow(b2 - b1, 2) + Math.pow(c2 - c1, 2));
    }

    public static function checkCollisionsS(_objects : /*Balls*/ Array) : void
    {
      var oa : Ball;
      var ob : Ball;
      for(var i : Number = 0; i < 10; i++) {
        for (var a : Number = 0; a < _objects.length; a++)
        {
          oa = _objects[a];
          for (var b : Number = a; b < _objects.length; b++) {
            ob = _objects[b];
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

    public function checkCollisions(_o : Array) : void
    {
      checkCollisionsS(_o);
    }
  }
}


