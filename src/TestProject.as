package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.display.*;
  import flash.events.*;
  import flash.geom.Vector3D;
  import flash.text.TextField;

  public class TestProject extends Sprite {
    private var _view:away3d.containers.View3D;
    private var _plane:away3d.entities.Mesh;

    private function onEnterFrame(ev : Event) : void { 
      _plane.rotationY += 1;
      _view.render(); 
    }

    public function TestProject() {
        _view = new View3D(); 
        _view.backgroundColor = 0x666666; 
        _view.antiAlias = 4; 
        _view.camera.z = -600;
        _view.camera.y = 500;
        _view.camera.lookAt(new Vector3D());
//        this.addChild(_view); 

        _plane = new Mesh(new PlaneGeometry(700,700));
        _view.scene.addChild(_plane);
//        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 

        var display_txt:TextField = new TextField();
        display_txt.text = "Hello World!";
        this.addChild(display_txt);
    }
  }
}

