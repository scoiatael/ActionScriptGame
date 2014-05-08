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

  public class Player extends PhysicalObject {

    [Embed(source="../../assets/skins/player_diffuse.jpg")]
    private static var PlayerDiffuse:Class;
    [Embed(source="../../assets/skins/player_specular.jpg")]
    private static var PlayerSpecular:Class;
    private var mat : TextureMaterial;

    private var ball : away3d.entities.Mesh;
    private const var radius : Number;
    
    public function Player(n : Number = 20) {
      radius = n;

      mat = new TextureMaterial(Cast.bitmapTexture(PlayerDiffuse));
      mat.specularMap = Cast.bitmapTexture(PlayerSpecular);

      ball = new Mesh(new SphereGeometry(radius), mat);
      addChild(ball);
      moveUp(radius);
      addEventListener(Object3DEvent.POSITION_CHANGED, function () : void { 
        ball.pitch(0.75 * Math.sqrt(_speed.length) * _speed.dotProduct(forwardVector)); });
    }
    
    public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }

    public function thrustForward(d : Number) : void {
      var v : Vector3D = forwardVector.clone();
      v.scaleBy(d);
      _speed = _speed.add(v);
    }

  }
}

