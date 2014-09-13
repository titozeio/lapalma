package {

import com.chococorp.lapalma.global.LPConstants;
import com.chococorp.lapalma.main.LPMain;

import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.text.TextField;

import starling.core.Starling;

public class Main extends Sprite {
    public function Main() {
        initStarling();
    }

    protected var _starling:Starling;

    protected function initStarling():void
    {
        Starling.multitouchEnabled = true;
//        Starling.handleLostContext = AppPlatforms.platform == AppPlatforms.ANDROID_VERSION;

        _starling = new Starling(LPMain, stage, new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight));
        _starling.stage.stageWidth = LPConstants.STAGE_WIDTH;
        _starling.stage.stageHeight = LPConstants.STAGE_HEIGHT;
        _starling.simulateMultitouch = !LPConstants.DEBUG_MODE;
        _starling.enableErrorChecking = LPConstants.DEBUG_MODE;
        _starling.start();

    }
}
}
