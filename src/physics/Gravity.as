// vim: syntax=actionscript
package physics {
    import objects.PhysicalObject;
    import flash.geom.Vector3D;

    public class Gravity implements ProtoForce {
        public static function actOnS(o : PhysicalObject) : Vector3D {
          var downV : Vector3D = o.upVector.clone();
          downV.scaleBy(-1);
          downV.scaleBy(o.mass*Constants.Gravity);
          trace(downV);
          return downV;
        }
        public function Gravity() {
        }
        public function actOn( o : PhysicalObject) : Vector3D {
          return actOnS(o);
        }
    }
}

