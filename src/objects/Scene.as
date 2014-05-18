// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.materials.lightpickers.*;
  import away3d.core.base.*;

  import flash.geom.*;
  import physics.*;

  public class Scene extends ObjectContainer3D /* all of its children must be Physical Objects */ implements objects.ObjectInterface {
    private var _plane : Plane ;
    private var light : LightPickerBase;
    private var checker : CollisionChecker;

    public function eachChild(f : Function) : void {
      for (var a : Number = 0; a <  numChildren; a++) {
        var o : PhysicalObject = PhysicalObject(getChildAt(a));
//        if(_objInScene[a]) {
          f(o, a);
//        }
      }
    }
/*
    private var _obj : Array;
    private var _objInScene : Array;

    override public function addChild(o : ObjectContainer3D) : ObjectContainer3D {
      super.addChild(o);
      var inserted : Boolean = false;
      eachChild(function(oa : PhysicalObject, a : Number) : void {
        if(! _objInScene[a] ) {
          _objInScene[a] = true;
          _obj[a] = o;
          inserted = true;
        }
      });
      if(! inserted) {
        _obj.push(o);
        _objInScene.push(true);
      }
      return o;
    }

    override public function removeChild(o : ObjectContainer3D) : void {
      super.removeChild(o);
      eachChild(function(oa : PhysicalObject, a : Number) : void {
        if(oa == o ) {
          _objInScene[a] = true;
          _obj[a] = null;
        }
      });
    }
  */
    public function update(t : Number) : void {
      for (var a : Number = 0; a <  numChildren; a++) {
        var o : PhysicalObject = PhysicalObject(getChildAt(a));
        if(o.isAlive()) {
          o.update(t);
        } else {
          trace("someone's dead");
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

    private function randomPosition() : Vector3D {
      var v : Vector3D;
      while( v == null || (! _plane.hasInside(v)))
        v = new Vector3D(Math.random()*_plane._R, 50, Math.random()*_plane._R)
      return v;
    }

    public function addObject(o : Ball) : void {
      if(light != null) {
        o.addLightPicker(light);
      }
      addChild(o);
    }

    public function addEnemy(n : Number) : void {
      var b : Enemy = new Enemy(this, n, randomPosition());
      addObject(b);
    }

    public function addGrowUp() : void {
      var b : GrowUp = new GrowUp(randomPosition());
      addObject(b);
    }

    public function addRandom( n : Number = -1) : void {
      if(n == -1) {
        n = Math.random();
      }
      if(Math.random() < n) {
        addEnemy(60*n*Math.random());
      } else {
        addGrowUp();
      }
    }
    
    public function Scene() {
//      _obj = new Array();
//      _objInScene = new Array();
      checker = new CollisionChecker();
      light = null;
      _plane = new Plane();
      addChild(_plane);
      addEnemy(50);
      addGrowUp();
    }

  }
}

