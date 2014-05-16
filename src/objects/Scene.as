// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.materials.lightpickers.*;

  public class Scene extends ObjectContainer3D implements objects.BaseInterface {
    private var _plane : Plane ;

    public function update(t : Number) : void {
      _plane.update(t);
    }

    public function addLightPicker(l : LightPickerBase) : void {
      _plane.addLightPicker(l);
    }
    
    public function makePhysicsWork(p : Ball) : void {
      _plane.checkInside([p]);
    }

    public function Scene() {
      _plane = new Plane();
      this.addChild(_plane);
    }

  }
}

