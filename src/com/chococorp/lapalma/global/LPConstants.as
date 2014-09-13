/**
 * Created by sergio on 13/09/2014.
 */
package com.chococorp.lapalma.global {
import flash.display.Stage;

public class LPConstants {
    public function LPConstants() {
    }

    public static var stage:Stage;

    public static const STAGE_HEIGHT_DEFAULT:int=960;
    public static const STAGE_WIDTH_DEFAULT:int=640;

    public static function get STAGE_HEIGHT():int{
        if(!stage) return STAGE_HEIGHT_DEFAULT;
        return STAGE_WIDTH_DEFAULT / stage.fullScreenWidth * stage.fullScreenHeight;
    }
    public static function get STAGE_WIDTH():int{
        return STAGE_WIDTH_DEFAULT;
    }

    public static const DEBUG_MODE:Boolean=true;
}
}
