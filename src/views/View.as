// vim: syntax=actionscript
package views {

  import flash.geom.Vector3D;
  import away3d.containers.*;

  public class View extends away3d.containers.View3D {

    [Embed(source="../assets/skins/skybox/snow_positive_x.jpg")]
    private var EnvPosX:Class;
    [Embed(source="../assets/skins/skybox/snow_positive_y.jpg")]
    private var EnvPosY:Class;
    [Embed(source="../assets/skins/skybox/snow_positive_z.jpg")]
    private var EnvPosZ:Class;
    [Embed(source="../assets/skins/skybox/snow_negative_x.jpg")]
    private var EnvNegX:Class;
    [Embed(source="../assets/skins/skybox/snow_negative_y.jpg")]
    private var EnvNegY:Class;
    [Embed(source="../assets/skins/skybox/snow_negative_z.jpg")]
    private var EnvNegZ:Class;

    private var _skyBox:SkyBox; 

    public function setWidth(w : Number) : void {
      this.width = w;
    }
    public function setHeight(h : Number) : void {
      this.height = h;
    }

    public function View() {

        //setup the cube texture
      var cubeTexture:BitmapCubeTexture = new BitmapCubeTexture(
        Cast.bitmapData(EnvPosX), 
        Cast.bitmapData(EnvNegX), 
        Cast.bitmapData(EnvPosY), 
        Cast.bitmapData(EnvNegY), 
        Cast.bitmapData(EnvPosZ), 
        Cast.bitmapData(EnvNegZ));

      _skyBox = new SkyBox(cubeTexture);
      this.scene.addChild(_skyBox);

      this.camera.z = -600;
      this.camera.y = 500;
      this.camera.lookAt(new Vector3D());

    }

  }
}

