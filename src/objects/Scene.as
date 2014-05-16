// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.materials.lightpickers.*;
  import flash.geom.*;
  import physics.*;

  public class Scene extends ObjectContainer3D implements objects.ObjectInterface {
    private var _plane : Plane ;
    private var _objects : /* Ball */ Array;
    private var light : LightPickerBase;
    private var checker : CollisionChecker;

    public function update(t : Number) : void {
      _plane.update(t);
      for (var a : Number = 0; a <  _objects.length; a++) {
        var o : Ball = _objects[a];
        o.update(t);
      }
    }

    public function addLightPicker(l : LightPickerBase) : void {
      _plane.addLightPicker(l);
      light = l;
      for (var a : Number = 0; a <  _objects.length; a++) {
        trace(a);
        var o : Ball = _objects[a];
        o.addLightPicker(l);
      }
    }
    
    public function makePhysicsWork(p : Ball) : void {
      _plane.checkInside(_objects.concat(p));
      checker.checkCollisions(_objects.concat(p));
    }

    public function addBall() : void {
      var b : Ball = new Ball(10, new Vector3D(100,20,100));
      if(light != null) {
        b.addLightPicker(light);
      }
      this.addChild(b);
      _objects = _objects.concat(b);
    }
    
    public function Scene() {
      checker = new CollisionChecker();
      light = null;
      _plane = new Plane();
      _objects = [];
      this.addChild(_plane);
      addBall();
    }

  }
}

