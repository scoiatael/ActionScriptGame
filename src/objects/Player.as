// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.materials.lightpickers.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.geom.Vector3D;

  public class Player extends PhysicalObject {

    [Embed(source="../../assets/skins/player_diffuse.jpg")]
    private static var PlayerDiffuse:Class;
    [Embed(source="../../assets/skins/player_specular.jpg")]
    private static var PlayerSpecular:Class;
    private var mat : TextureMaterial;

    private var ball : away3d.entities.Mesh;
    
    public function Player() {
      mat = new TextureMaterial(Cast.bitmapTexture(PlayerDiffuse));
      mat.specularMap = Cast.bitmapTexture(PlayerSpecular);

      ball = new Mesh(new SphereGeometry(20), mat);
      addChild(ball);
      moveUp(20);
    }
    
    public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }

    public function thrustForward(d : Number) : void {
      var v : Vector3D = forwardVector.clone();
      v.scaleBy(d);
      _speed = _speed.add(v);
      ball.pitch(d * _speed.length);
    }

  }
}

