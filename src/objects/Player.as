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
    private static var rollOver : Number;
    private var mat : TextureMaterial;
    
    public function Player() {
      mat = new TextureMaterial(Cast.bitmapTexture(PlayerDiffuse));
      mat.specularMap = Cast.bitmapTexture(PlayerSpecular);

      super(new SphereGeometry(20), mat);
      moveUp(20);
      rollOver = 0;
    }
    
    public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }

  }
}

