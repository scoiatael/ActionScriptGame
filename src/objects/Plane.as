// vim: syntax=actionscript
package objects {
  import away3d.containers.*;
  import away3d.entities.*;
  import away3d.materials.*;
  import away3d.primitives.*;
  import away3d.materials.lightpickers.*;
  import away3d.utils.*;

  public class Plane extends PhysicalObject {

    [Embed(source="../../assets/skins/floor_diffuse.jpg")]
    private static var FloorDiffuse:Class;
    [Embed(source="../../assets/skins/player_specular.jpg")]
    private static var FloorSpecular:Class;
    private var mat : TextureMaterial
    private var H : Number;
    private var R : Number;
    private var _plane : Mesh;

    override public function addLightPicker(l : LightPickerBase) : void {
      mat.lightPicker = l;
    }
    
    public function checkInside ( _objects : /*PhysicalObject*/ObjectContainer3D ) : void {
      for (var a : Number = 0; a < _objects.numChildren; a++) {
        var o : PhysicalObject = PhysicalObject(_objects.getChildAt(a));
        var l : Number = Math.sqrt(Math.pow(o.x,2) + Math.pow(o.z,2));
        if(l > R) {
          o.fallOff();
        }
      }
    }

    public function Plane( h : Number = 50, r : Number = 700) {
      mat = new TextureMaterial(Cast.bitmapTexture(FloorDiffuse));
      mat.specularMap = Cast.bitmapTexture(FloorSpecular);
      _plane = new Mesh(new CylinderGeometry(r, r,h), mat);
      addChild(_plane);
      _plane.moveDown(h/2);
      H = h;
      R = r;
      _objectType = "Plane";
    }

  }
}

