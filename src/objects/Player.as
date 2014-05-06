// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  public class Player extends away3d.entities.Mesh implements objects.BaseInterface {

    [Embed(source="../../assets/skins/floor_diffuse.jpg")]
    private static var FloorDiffuse:Class;
    
    private var count : Number;

    public function update(t : Number) : void {
      count += t;
      this.scaleX = this.scaleY = this.scaleZ = Math.sin(count);
    }

    public function Player() {
      super(new SphereGeometry(700), 
        new TextureMaterial(Cast.bitmapTexture(FloorDiffuse)));
    }

  }
}

