package physics  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class CollisionCheckerTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:CollisionChecker;

        [Before]
        public function setUp():void {
            instance = new CollisionChecker();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is CollisionChecker", instance is CollisionChecker);
        }
    }
}

