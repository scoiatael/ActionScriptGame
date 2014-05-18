// vim: syntax=actionscript
package events {
    import flash.events.Event;

    public class ScoreChangeEvent extends Event {
        public static const SCORE_CHANGED:String = "scoreChanged";
        public static const PLAYER_DIED:String = "playerDied";

        public var score:Number;

        public function ScoreChangeEvent(t : String, n : Number, b : Boolean = false, c : Boolean = false) {
          super(t, b, c);
          score = n;
        }

        public override function clone() : Event
        {
          return new ScoreChangeEvent(type, score, bubbles, cancelable);
        }
    }
}

