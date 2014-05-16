// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.materials.lightpickers.*;
  import away3d.utils.*;

  public class Plane extends away3d.entities.Mesh implements objects.ObjectInterface {

    [Embed(source="../../assets/skins/floor_diffuse.jpg")]
    private static var FloorDiffuse:Class;
    [Embed(source="../../assets/skins/player_specular.jpg")]
    private static var FloorSpecular:Class;
    private var mat : TextureMaterial
    private var H : Number;
    private var R : Number;


    public function update(t : Number) : void {
      // this.rotationY += t;
    }

    public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }
    
    public function checkInside ( objects : /*Ball*/Array ) : void {
      for (var a : String in objects) {
        var o : Ball = objects[a];
        var l : Number = Math.sqrt(Math.pow(o.x,2) + Math.pow(o.z,2));
        if(l > R) {
          o.fallOff();
        }
      }
    }

    public function Plane( h : Number = 50, r : Number = 700) {
      mat = new TextureMaterial(Cast.bitmapTexture(FloorDiffuse));
      mat.specularMap = Cast.bitmapTexture(FloorSpecular);
      super(new CylinderGeometry(r, r,h), mat);
      moveDown(h/2);
      H = h;
      R = r;
    }

  }
}

