// vim: syntax=actionscript
package objects {
  import away3d.containers.*;

  public class SimpleScene extends ObjectContainer3D implements BaseInterface {
    private var _plane : SimplePlane ;

    public function SimpleScene() {
      _plane = new SimplePlane();
    }

    public function update(d : number) : void {
      _plane.update(d);
    }

  }
}

