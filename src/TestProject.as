// vim: syntax=actionscript
package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;
  import away3d.materials.lightpickers.*;

  import flash.display.*;
  import flash.events.*;
  import flash.ui.*;
  import flash.utils.*;

  import objects.*;
  import views.View;

  [SWF(backgroundColor="#000000", frameRate="60")]

  public class TestProject extends Sprite {
    private var view:View;
    private var _objects:objects.Scene;
    private var player:Player;
    private var keys:Array = [];
    private var timeSinceLastUpdate:Number;

    private function onEnterFrame(ev : Event) : void { 
      var t : Number = getTimer();
      var d : Number = (t - timeSinceLastUpdate) / 10 / 8;
      timeSinceLastUpdate = t;
      if(keys[Keyboard.Q]) {
          player.thrustLeftward(d);
      }
      if(keys[Keyboard.E]) {
          player.thrustLeftward(-d);
      }
      if(keys[Keyboard.SPACE]) {
          player.thrustUpward(d*10);
      }
      if(keys[Keyboard.W]) {
          player.thrustForward(d);
      }
      if(keys[Keyboard.S]) {
          player.thrustForward(-d);
      }
      if(keys[Keyboard.A]) {
          player.yaw(2*-d);
      }
      if(keys[Keyboard.D]) {
          player.yaw(2*d);
      }
      _objects.makePhysicsWork(player);
      _objects.update(d);
      player.update(d);
      if(player.isAlive()) {
      } else {
        view.distance = Math.abs(player.y) + 10;
        view.setTilt(90);
      }
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
   
/* 
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
*/
    private function onKeyDown(e:KeyboardEvent):void
    {
      keys[e.keyCode] = true;
    }
     
    private function onKeyUp(e:KeyboardEvent):void
    {
      keys[e.keyCode] = false;
    }

    public function TestProject() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        player = new Player();

        view = new View(player); 
        this.addChild(view); 

        player.addLightPicker(new StaticLightPicker([view.light]));
        _objects = new objects.Scene();
        _objects.addLightPicker(new StaticLightPicker([view.light]));
        view.scene.addChild(player);
//        _objects.addChild(player);
        view.scene.addChild(_objects);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
        stage.addEventListener(Event.RESIZE, onResize);
        onResize();
        
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        timeSinceLastUpdate = getTimer();
    }
  }
}

