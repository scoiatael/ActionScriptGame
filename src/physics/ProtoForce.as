// vim: syntax=actionscript
package physics {
    import objects.PhysicalObject;
    import flash.geom.Vector3D;

    public interface ProtoForce {
        function actOn(o : PhysicalObject) : Vector3D ;
    }
}

