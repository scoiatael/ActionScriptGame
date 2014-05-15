// vim: syntax=actionscript
package physics {

    public class CollisionChecker {
        public function length3D(a1:Number,b1:Number,c1:Number,
                                  a2:Number,b2:Number,c2:Number) : Number {
          return Math.sqrt((a2-a1)^2 + (b2-b1)^2 + (c2-c1)^2);
        }

        public function CollisionChecker() {
        }
        public static function checkCollisions(objects : /*Players*/ Array) : void 
        {
          for (var a in objects) {
            for (var b in objects) {
              if(a != b && a.radius + b.radius <= length3D(a.x,a.y,a.z,b.x,b.y,b.z)) {
                a.collideWith(b);
                b.collideWith(a);
              }
            }
          }
        }
    }
}

