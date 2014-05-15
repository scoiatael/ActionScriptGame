// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.materials.lightpickers.*;

  public class SimpleScene extends ObjectContainer3D implements objects.BaseInterface {
    private var _plane : SimplePlane ;

    public function update(t : Number) : void {
      _plane.update(t);
    }

    public function addLightPicker(l : LightPickerBase) : void {
      _plane.addLightPicker(l);
    }

    public function SimpleScene() {
      _plane = new SimplePlane();
      this.addChild(_plane);
    }

  }
}

