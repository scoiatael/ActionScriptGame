// vim: syntax=actionscript
package helpers {
  import flash.text.*;
  import events.*;

  public class ScoreCounter extends TextField {

    public function ScoreCounter( h : Number = 40)
    {

      super();
      multiline = true;
      wordWrap = true;
      background = true;
      height = h;

      var format: TextFormat = new TextFormat();
      format.font = "Verdana";
      format.color = 0xFF8844;
      format.size = 20;

      defaultTextFormat = format;
      htmlText = "Points: <b>0</b>";

    }

    public function scoreChangedHandler(ev : ScoreChangeEvent) : void { 
      setScore(ev.score);
    }
    
    private function setScore(n : Number) : void {
      htmlText = "Points <b>" + n.toString() + "</b>"; 
    }

    public function resetScore() : void {
      setScore(0);
    }
  }
}


