// vim: syntax=actionscript
package objects {
  
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.materials.lightpickers.*;
  import away3d.primitives.*;
  import away3d.utils.*;
  import away3d.core.base.*;

  import flash.geom.*;
  import flash.utils.*;
  import physics.*;

  public class PhysicalObject extends ObjectContainer3D implements objects.ObjectInterface {
    protected var _force : Vector3D;
    protected var forces : Array;
    protected var _speed : Vector3D;
    protected var _mass : Number;
    protected var alive : Boolean;
    protected var falling : Boolean; 
    protected var _objectType : String;
    protected var _radius : Number;
    
    public function addLightPicker(l : LightPickerBase) : void {
    }

    public function update( t : Number ) : void {
      if( ! falling ) {
        if( y > 0 ) {
        } else {
          y = 0;
          _speed.y = 0;
        }
      }
      if(_speed.length != 0) {
        translate(_speed, _speed.length * t);
      }
      _force.scaleBy(t/_mass)
      _speed = _speed.add(_force);
      _force.scaleBy(0);
      updateForces();
    }

    public function get objectType () : String {
      return _objectType;
    }

    public function collideWith (o : PhysicalObject) : void {
      var v:* = position.subtract(o.position);
      translate(v, (1/16))     
      _speed = o._speed.clone();
 //     lookAt(_speed.clone());
    }

    public function fallOff() : void {
      if( ! falling) {
        lookAt(new Vector3D(0,0,0));
        falling = true;
        trace("falling off");
        setTimeout(die,1000);
      }
    }
    
    public function thrustUpward(d : Number) : void {
      if( y <= 5 ) {
        var v : Vector3D = upVector.clone();
        v.scaleBy(d);
        _speed = _speed.add(v);
        y = Math.max(y, 0.1);
      }
    }

    public function thrustForward(d : Number) : void {
      if( y <= 5 ) {
        var v : Vector3D = forwardVector.clone();
        v.scaleBy(d);
        _speed = _speed.add(v);
      }
    }

    public function thrustLeftward(d : Number) : void {
      if( y <= 5 ) {
        var v : Vector3D = leftVector.clone();
        v.scaleBy(d);
        _speed = _speed.add(v);
      }
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

    public function get mass() : Number {
      return _mass;
    }
    
    public function die() : void {
      alive = false;
    }

    public function isAlive() : Boolean {
      return alive;
    }

    public function get radius () : Number {
      return _radius;
    }

    public function PhysicalObject(  
                                    fs : Array = null, m : Number = 1, s : Vector3D = null ) {
      if(fs == null) {
        fs = new Array();
      }
      if(s == null) {
        s = new Vector3D();
      }
      forces = fs.concat( new Drag(), new Gravity() );
      _mass = m;
      _speed = s;
      _force = new Vector3D;
      alive = true;
      falling = false;
      updateForces();
      _objectType = "PhysicalObject";
      _radius = -1000;
    }
  }
}

  
