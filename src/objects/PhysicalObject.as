// vim: syntax=actionscript
package objects {
  
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;
  import away3d.core.base.*;

  import flash.geom.*;
  import physics.*;

  public class PhysicalObject extends away3d.entities.Mesh implements objects.BaseInterface {
    private var _force : Vector3D;
    private var forces : Array;
    private var _speed : Vector3D;
    private var mass : Number;

    public function update( t : Number ) : void {
      if(speed.length != 0) {
        translate(_speed, _speed.length * t);
      }
      _force.scaleBy(t/mass)
      _speed = _speed.add(_force);
      _force.scaleBy(0);
      updateForces();
    }
    
    private function updateForces() : void {
      for each (var f : ProtoForce in forces) {
        _force = _force.add(f.actOn(this)); 
      }
      if(Math.abs(_force.length) < Constants.Epsilon) {
        _force.scaleBy(0);
      }
    }
    
    public function get speed() : Vector3D {
      return _speed;
    }

    public function PhysicalObject( g : Geometry, mat : MaterialBase = null, 
                                    fs : Array = null, m : Number = 1, s : Vector3D = null ) {
      super(g, mat);
      if(fs == null) {
        fs = new Array();
      }
      if(s == null) {
        s = new Vector3D();
      }
      forces = fs.concat( new Drag());
      mass = m;
      _speed = s;
      _force = new Vector3D;
      updateForces();
    }

    public function thrustForward(d : Number) : void {
      var v : Vector3D = forwardVector.clone();
      v.scaleBy(d);
      _force = _force.add(v);
    }
  }
}

  
