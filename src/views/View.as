// vim: syntax=actionscript
package views {

  import flash.geom.Vector3D;
  import away3d.containers.*;
  import away3d.primitives.*;
  import away3d.controllers.*;
  import away3d.textures.*;
  import away3d.utils.*;
  import away3d.events.*;

  import away3d.lights.*;

  public class View extends away3d.containers.View3D {

    [Embed(source="../../assets/skins/skybox/snow_positive_x.jpg")]
    private var EnvPosX:Class;
    [Embed(source="../../assets/skins/skybox/snow_positive_y.jpg")]
    private var EnvPosY:Class;
    [Embed(source="../../assets/skins/skybox/snow_positive_z.jpg")]
    private var EnvPosZ:Class;
    [Embed(source="../../assets/skins/skybox/snow_negative_x.jpg")]
    private var EnvNegX:Class;
    [Embed(source="../../assets/skins/skybox/snow_negative_y.jpg")]
    private var EnvNegY:Class;
    [Embed(source="../../assets/skins/skybox/snow_negative_z.jpg")]
    private var EnvNegZ:Class;

    private var _cameraController : FollowController;

    private var _skyBox:SkyBox; 
    
    private var _light : PointLight;

    public function setWidth(w : Number) : void {
      this.width = w;
    }
    public function setHeight(h : Number) : void {
      this.height = h;
    }

    public function View( lookAt : ObjectContainer3D = null ) {

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

      _cameraController = new FollowController(this.camera, lookAt, 10, 200);

      _light = new PointLight();
      _light.moveTo(0,500,0);
//      _light.direction = new Vector3D(0,-1,0);
      _light.lookAt(new Vector3D(0,0,0));
      _light.ambient = 0.2;
      _light.diffuse = 0.5;
      _light.specular = 0.9
      this.scene.addChild(_light);
/*
      if(lookAt != null) {
        _light.direction = lookAt.position;
        lookAt.addEventListener(Object3DEvent. POSITION_CHANGED, function () : void { 
          _light.direction = lookAt.position; });
      }
*/

    }

    public function get light() : PointLight {
      return _light;
    }

  }
}

