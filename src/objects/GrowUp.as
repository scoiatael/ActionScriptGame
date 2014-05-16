// vim: syntax=actionscript
package objects {
  import flash.geom.*;
  import away3d.materials.*;
  import away3d.utils.*;

  public class GrowUp extends Ball {
    [Embed(source="../../assets/skins/growup_diffuse.png")]
    private static var BallDiffuse:Class;
    [Embed(source="../../assets/skins/growup_specular.jpg")]
    private static var BallSpecular:Class;

    public function GrowUp(v : Vector3D = null, n : Number = 8)
    {
      var mat : TextureMaterial;
      mat = new TextureMaterial(Cast.bitmapTexture(BallDiffuse));
      mat.specularMap = Cast.bitmapTexture(BallSpecular);
      mat.alpha = 0.8;
      super(n, v, mat);
      ball.moveUp(Math.max(20-n/2, 0));
      _objectType = "GrowUp";
    }

    override public function collideWith (o : PhysicalObject) : void {
      die();
    }
  }
}


