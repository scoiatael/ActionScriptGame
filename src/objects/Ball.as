// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.materials.lightpickers.*;
  import away3d.primitives.*;
  import away3d.utils.*;
  import away3d.events.*;

  import flash.geom.Vector3D;
  import flash.utils.*;

  import physics.*;

  public class Ball extends PhysicalObject {

    [Embed(source="../../assets/skins/player_diffuse.jpg")]
    private static var BallDiffuse:Class;
    [Embed(source="../../assets/skins/player_specular.jpg")]
    private static var BallSpecular:Class;
    private var mat : TextureMaterial;

    protected var ball : away3d.entities.Mesh;
    
    public function Ball(n : Number = 20, v : Vector3D = null, m : TextureMaterial = null ) {
      _radius = n;

      if(m == null) {
        mat = new TextureMaterial(Cast.bitmapTexture(BallDiffuse));
        mat.specularMap = Cast.bitmapTexture(BallSpecular);
      } else {
        mat = m;
      }

      ball = new Mesh(new SphereGeometry(_radius), mat);
      addChild(ball);
      ball.moveUp(_radius * 5/6);
      addEventListener(Object3DEvent.POSITION_CHANGED, function () : void { 
        ball.pitch(0.75 * Math.sqrt(_speed.length) * _speed.dotProduct(forwardVector));});
      if(v != null) {
        position = v;
      }
    }

    public function grow(n : Number = 5) : void {
      scale((_radius+n)/_radius);
      if(_radius+n < 100)  {
        _radius += n;
      }
      thrustUpward(2*_radius);
    }

    public function shrink(n : Number = 5) : void {
      scale((_radius-n)/_radius);
      _radius -= n;
      thrustUpward(2*_radius);
      if(_radius < 5) {
        die();
      }
    }
    
    override public function collideWith(o : PhysicalObject) : void {
      if(o.objectType == "GrowUp") {
        grow();
      } else {
        super.collideWith(o);
        shrink();
      }
    }
      
    override public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }

  }
}

