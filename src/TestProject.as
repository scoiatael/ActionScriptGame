// vim: syntax=actionscript
package {

  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;
  import away3d.materials.lightpickers.*;
  import away3d.debug.*;

  import flash.display.*;
  import flash.events.*;
  import flash.ui.*;
  import flash.utils.*;

  import objects.*;
  import views.View;
  import helpers.*;
  import events.*;

  [SWF(backgroundColor="#000000", frameRate="60")]

  public class TestProject extends Sprite {
    private var _log:LogWriter;
    private var _score:ScoreCounter;
    private var _debug:AwayStats;


    private var view:View;
    private var _objects:objects.Scene;
    private var player:Player;
    private var keys:Array = [];
    private var timeSinceLastUpdate:Number;
    private var endAnim : Boolean;
    private var _stage : Number; // <0 - paused | =0 - main menu | >0 - playing

    private var timeInGame : Number;

    public function isPaused() : Boolean {
      return _stage < 0;
    }
    public function isMainMenu() : Boolean {
      return _stage == 0;
    }
    public function get gameStage() : Number {
      return (_stage > 0) ? _stage : 0;
    }

    private function onEnterFrame(ev : Event) : void { 
      var t : Number = getTimer();
      var d : Number = (t - timeSinceLastUpdate) / 10 / 8;
      timeSinceLastUpdate = t;
      if(gameStage > 0) {
        timeInGame += d / 2;
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

        _objects.makePhysicsWork();
        _objects.update(d);

        if(player.isAlive()) {
          if(timeInGame > 100 * _stage && _stage < 10) {
            for(var i:Number = 0; i<_stage / 2; i++)
              _objects.addRandom(_stage / 30 * 2);
            if(_stage < 10) {
              _stage++;
            }
          }
        } else {
          view.distance = Math.abs(player.y) + 10;
          if(! endAnim) {
            endAnim = true;
            setTimeout(resetGame, 2000);
            view.setTilt(90);
          }
        }
      }
      if(isMainMenu()) {
        _stage++;
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

    private function onKeyDown(e:KeyboardEvent):void
    {
      keys[e.keyCode] = true;
    }
     
    private function onKeyUp(e:KeyboardEvent):void
    {
      keys[e.keyCode] = false;
    }

    private function playerDiedHandler(ev : ScoreChangeEvent) : void {
      _log.writeLog(" S " + ev.score.toString() + " L " + _stage.toString() +  " D " + (new Date()).toString());
    }

    public function TestProject() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame); 
        stage.addEventListener(Event.RESIZE, onResize);
        
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);

        _log = new LogWriter();
        _score = new ScoreCounter(40);
        addChild(_score);

        _debug = new AwayStats();
        _debug.y += 40;
        addChild(_debug);

       
        _stage = 0; 
        resetGame();
        onResize();
    }

    public function resetGame() : void {
        trace("resetting");
        _log.writeLog("New game " + (new Date()).toString());

        if(view != null) {
          _debug.unregisterView(view);
          removeChild(view);
          view.dispose();
        }

        timeInGame = 0;

        player = new Player();
        player.addEventListener(ScoreChangeEvent.SCORE_CHANGED, _score.scoreChangedHandler);
        player.addEventListener(ScoreChangeEvent.PLAYER_DIED, playerDiedHandler);
        _score.resetScore();

        view = new View(player); 
        addChild(view); 
        _debug.registerView(view);

        //player.addLightPicker(new StaticLightPicker([view.light]));
        _objects = new objects.Scene();
        _objects.addChild(player);
        _objects.addLightPicker(new StaticLightPicker([view.light]));
//        view.scene.addChild(player);
        view.scene.addChild(_objects);

        timeSinceLastUpdate = getTimer();
        endAnim = false;
    }
  }
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
