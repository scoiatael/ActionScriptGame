// vim: syntax=actionscript
package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.display.*;
  import flash.events.*;
  import flash.ui.*;

  import objects.*;
  import views.View;

  [SWF(backgroundColor="#000000", frameRate="60")]

  public class TestProject extends Sprite {
    private var view:View;
    private var _objects:SimpleScene;
    private var player:Player;

    private function onEnterFrame(ev : Event) : void { 
      var d : Number = 1;
      _objects.update(d);
      player.update(d);
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
    
    private function onKeydown(event : KeyboardEvent) : void {
      switch (event.charCode) {
        case 119:
        case Keyboard.W:
          player.thrustForward(1);
          break;
        case 115:
        case Keyboard.S:
          player.thrustForward(-1);
          break;
        case 97:
        case Keyboard.A:
          player.yaw(-1);
          break;
        case 100:
        case Keyboard.D:
          player.yaw(1);
          break;
      }
      
    }

    public function TestProject() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        player = new Player();

        view = new View(player); 
        this.addChild(view); 

        view.scene.addChild(player);

        _objects = new SimpleScene();
        view.scene.addChild(_objects);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
        stage.addEventListener(Event.RESIZE, onResize);
        onResize();
        
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeydown);
    }
  }
}

