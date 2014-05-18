package helpers  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class ScoreCounterTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:ScoreCounter;

        [Before]
        public function setUp():void {
            instance = new ScoreCounter();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is ScoreCounter", instance is ScoreCounter);
        }
    }
}

