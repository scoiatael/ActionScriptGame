// vim: syntax=actionscript
package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.display.*;
  import flash.events.*;

  import objects.SimplePlane;
  import views.SimpleView;

  [SWF(backgroundColor="#000000", frameRate="60")]

  public class TestProject extends Sprite {
    private var view:SimpleView;
    private var plane:SimplePlane;

    private function onEnterFrame(ev : Event) : void { 
      plane.update();
      view.render(); 
    }

    /**
    * stage listener for resize events
    */
    private function onResize(event:Event = null):void
    {
      view.setWidth(stage.stageWidth);
      view.setHeight(stage.stageHeight);
    }

    public function TestProject() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        view = new SimpleView(); 
        this.addChild(view.delegate()); 

        plane = new SimplePlane();
        view.addChild(plane.delegate());

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
        stage.addEventListener(Event.RESIZE, onResize);
        onResize();

    }
  }
}

