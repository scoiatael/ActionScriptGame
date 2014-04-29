// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.utils.*;

  public class SimplePlane extends away3d.entities.Mesh implements objects.BaseInterface {

    [Embed(source="../../assets/skins/floor_diffuse.jpg")]
    private static var FloorDiffuse:Class;


    public function update(t : Number) : void {
      this.rotationY += t;
    }

    public function SimplePlane() {
      super(new PlaneGeometry(700, 700), 
      new TextureMaterial(Cast.bitmapTexture(FloorDiffuse)));
    }

  }
}

