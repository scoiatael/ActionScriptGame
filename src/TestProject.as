package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.display.*;
  import flash.events.*;
  import flash.geom.Vector3D;

  public class TestProject extends Sprite {
    private var _view:away3d.containers.View3D;

    private function onEnterFrame(ev : Event) : void { 
      _view.render(); 
    }

    public function TestProject() {
        trace(">> TestProject Instantiated!");

        _view = new View3D(); 
        _view.backgroundColor = 0x666666; 
        _view.antiAlias = 4; 
        this.addChild(_view); 
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
    }
  }
}

