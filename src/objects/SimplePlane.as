// vim: syntax=actionscript
package objects {
    import away3d.containers.*;
    import away3d.entities.*;
    import away3d.materials.*;
    import away3d.primitives.*;
    import away3d.utils.*;

    public class SimplePlane {
      private var _plane:away3d.entities.Mesh;

      [Embed(source="../../assets/skins/floor_diffuse.jpg")]
      public static var FloorDiffuse:Class;


        public function update() : void {
          _plane.rotationY += 1;
        }

        public function SimplePlane() {
          _plane = new Mesh(new PlaneGeometry(700, 700), 
            new TextureMaterial(Cast.bitmapTexture(FloorDiffuse)));
        }
        
        public function delegate() : away3d.entities.Mesh {
          return _plane;
        }
    }
}

