package events  {
    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

    public class ScoreChangeEventTest {

        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var instance:ScoreChangeEvent;

        [Before]
        public function setUp():void {
            instance = new ScoreChangeEvent();
        }

        [After]
        public function tearDown():void {
            instance = null;
        }

        [Test]
        public function shouldBeInstantiated():void {
            assertTrue("instance is ScoreChangeEvent", instance is ScoreChangeEvent);
        }
    }
}

