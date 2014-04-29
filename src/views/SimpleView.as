// vim: syntax=actionscript
package views {

  import flash.geom.Vector3D;
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  public class SimpleView {

    private var _view:away3d.containers.View3D;

    public function render() : void {
      _view.render();
    }
    public function setWidth(w : Number) : void {
      _view.width = w;
    }
    public function setHeight(h : Number) : void {
      _view.height = h;
    }

    public function delegate() : away3d.containers.View3D {
      return _view;
    }

    public function SimpleView() {
      _view = new View3D(); 

      _view.camera.z = -600;
      _view.camera.y = 500;
      _view.camera.lookAt(new Vector3D());

    }

    public function addChild( c : ObjectContainer3D ) : void {
      _view.scene.addChild(c);
    }
  }
}

