// vim: syntax=actionscript
package views {

  import flash.geom.Vector3D;
  import away3d.containers.*;

  public class SimpleView extends away3d.containers.View3D {

    public function setWidth(w : Number) : void {
      this.width = w;
    }
    public function setHeight(h : Number) : void {
      this.height = h;
    }

    public function SimpleView() {
      this.camera.z = -600;
      this.camera.y = 500;
      this.camera.lookAt(new Vector3D());

    }

  }
}

