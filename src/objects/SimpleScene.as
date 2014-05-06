// vim: syntax=actionscript
package objects {
  import away3d.containers.*;

  public class SimpleScene extends ObjectContainer3D implements objects.BaseInterface {
    private var _plane : SimplePlane ;

    public function update(t : Number) : void {
      _plane.update(t);
    }

    public function SimpleScene() {
      _plane = new SimplePlane();
      this.addChild(_plane);
    }

  }
}

