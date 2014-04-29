// vim: syntax=actionscript
package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.display.*;
  import flash.events.*;
  import flash.geom.Vector3D;

  [SWF(backgroundColor="#000000", frameRate="60")]

  public class TestProject extends Sprite {
    private var _view:away3d.containers.View3D;
    private var _plane:away3d.entities.Mesh;

    [Embed(source="../assets/skins/floor_diffuse.jpg")]
    public static var FloorDiffuse:Class;

    private function onEnterFrame(ev : Event) : void { 
      _plane.rotationY += 1;
      _view.render(); 
    }

    /**
    * stage listener for resize events
    */
    private function onResize(event:Event = null):void
    {
      _view.width = stage.stageWidth;
      _view.height = stage.stageHeight;
    }

    public function TestProject() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        _view = new View3D(); 
        this.addChild(_view); 

        _view.camera.z = -600;
        _view.camera.y = 500;
        _view.camera.lookAt(new Vector3D());

        _plane = new Mesh(new PlaneGeometry(700, 700), 
          new TextureMaterial(Cast.bitmapTexture(FloorDiffuse)));
        _view.scene.addChild(_plane);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
        stage.addEventListener(Event.RESIZE, onResize);
        onResize();

    }
  }
}

