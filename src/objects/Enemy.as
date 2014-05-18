// vim: syntax=actionscript
package objects {
  import away3d.materials.*;
  import away3d.utils.*;
  import away3d.core.base.*;

  import flash.geom.*;

  import physics.*;

  public class Enemy extends Ball {

    [Embed(source = "../../assets/skins/enemy_diffuse.png")]
    private static var BallDiffuse: Class;
    [Embed(source = "../../assets/skins/enemy_specular.jpg")]
    private static var BallSpecular: Class;

    private var _env : Scene;

    public function Enemy(s : Scene, n : Number, v : Vector3D)
    {
      _env = s;
      var mat : TextureMaterial;
      mat = new TextureMaterial(Cast.bitmapTexture(BallDiffuse));
      mat.specularMap = Cast.bitmapTexture(BallSpecular);
      super(n, v, mat);
      _objectType = "Enemy";
    }

    private function findNearest(s : String) : PhysicalObject {
      var p : PhysicalObject;
      var d : Number;
      var that :* = this;
      _env.eachChild(function (o : PhysicalObject, a : Number) : void {
        if(o.objectType == s) {
          if(p == null) {
            p = o;
            d = CollisionChecker.distanceBetween(Object3D(that), p);
          } else {
            var x: Number = CollisionChecker.distanceBetween(Object3D(that), o);
            if( x < d) {
              p = o;
              d = x;
            }
          }
        }
      });
      return p;
    }

    override public function update(n : Number) : void {
      super.update(n);
      var p : PhysicalObject;
      if(_radius > 20) {
        //chase player
        p = findNearest("Player");
      } else {
        //run to nearest growup
        p = findNearest("GrowUp");
      }  
      if( p != null) {
        var toVec : Vector3D = p.position.clone().subtract(position);
        var cang : Number = forwardVector.dotProduct(toVec)/toVec.length;
        var ang : Number = Math.acos(cang);

        var czng : Number = leftVector.dotProduct(toVec)/toVec.length;
        var zng : Number = Math.acos(czng);

        ang = (zng < Math.PI/2) ? -ang : ang; 

        var maxAng : Number = n;
        if(Math.abs(ang) < maxAng) {
          yaw(ang);
          thrustForward(n);
        } else {
          if(ang > 0) {
            yaw(maxAng*2);
          } else {
            yaw(-maxAng*2);
          }
        }
      }
    }
  }
}


