// vim: syntax=actionscript
package physics {
    import objects.PhysicalObject;
    import flash.geom.Vector3D;

    public class Drag implements ProtoForce {
        public static function actOnS(o : PhysicalObject) : Vector3D {
          var spb : Vector3D =  o.speed.clone();
          spb.scaleBy(-1 * Constants.DragB); 
          var spa : Vector3D =  o.speed.clone();
          spa.scaleBy(-1 * o.speed.length * Constants.DragA);
          return spa.add(spb);
        }
        public function Drag() {
        }
        public function actOn( o : PhysicalObject) : Vector3D {
          return actOnS(o);
        }
    }
}

