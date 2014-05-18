// vim: syntax=actionscript
package objects {
  import flash.geom.*;

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
   
    public function hasInside(o : Vector3D) : Boolean {
        var l : Number = Math.sqrt(Math.pow(o.x,2) + Math.pow(o.z,2));
      return l < R;
    } 

    public function checkInside ( _objects : /*PhysicalObject*/Scene ) : void {
      _objects.eachChild(function (o : PhysicalObject, a : Number) : void {
        if(! hasInside(o.position)) {
          o.fallOff();
        }
      });
    }

    public function get _R() : Number {
      return R;
    }

    public function Plane( h : Number = 10, r : Number = 700) {
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

