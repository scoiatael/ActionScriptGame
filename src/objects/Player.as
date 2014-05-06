// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  import flash.geom.Vector3D;

  public class Player extends PhysicalObject {

    [Embed(source="../../assets/skins/player_diffuse.jpg")]
    private static var PlayerDiffuse:Class;
    private static var rollOver : Number;
    
    public function Player() {
      super(new SphereGeometry(20), 
        new TextureMaterial(Cast.bitmapTexture(PlayerDiffuse)));
      moveUp(20);
      rollOver = 0;
    }

  }
}

