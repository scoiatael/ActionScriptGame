// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.materials.lightpickers.*;
  import flash.geom.*;
  import physics.*;

  public class Scene extends ObjectContainer3D /* all of its children must be Physical Objects */ implements objects.ObjectInterface {
    private var _plane : Plane ;
    private var light : LightPickerBase;
    private var checker : CollisionChecker;

    public function update(t : Number) : void {
      var obs : Array = new Array();
      for (var a : Number = 0; a <  numChildren; a++) {
        var o : PhysicalObject = PhysicalObject(getChildAt(a));
        if(o.isAlive()) {
          o.update(t);
        } else {
          removeChild(o);
        }
      }
    }

    public function addLightPicker(l : LightPickerBase) : void {
      _plane.addLightPicker(l);
      light = l;
      for (var a : Number = 0; a <  numChildren; a++) {
        var o : PhysicalObject = PhysicalObject(getChildAt(a));
        o.addLightPicker(l);
      }
    }
    
    public function makePhysicsWork() : void {
      _plane.checkInside(this);
      checker.checkCollisions(this);
    }

    public function addObject(o : Ball) : void {
      if(light != null) {
        o.addLightPicker(light);
      }
      this.addChild(o);
    }

    public function addBall() : void {
      var b : Ball = new Ball(10, new Vector3D(100,20,100));
      addObject(b);
    }

    public function addGrowUp() : void {
      var b : GrowUp = new GrowUp(new Vector3D(-100,20,-100));
      addObject(b);
    }
    
    public function Scene() {
      checker = new CollisionChecker();
      light = null;
      _plane = new Plane();
      this.addChild(_plane);
      addBall();
      addGrowUp();
    }

  }
}

