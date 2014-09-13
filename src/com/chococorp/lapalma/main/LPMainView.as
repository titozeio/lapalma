/**
 * Created by sergio on 13/09/2014.
 */
package com.chococorp.lapalma.main {
import com.chococorp.lapalma.events.LPEventTypes;
import com.chococorp.lapalma.global.LPConstants;
import com.generamobile.utils.CustomAssetManager;
import com.generamobile.utils.StarlingUtils;

import flash.filesystem.File;
import flash.geom.Point;

import starling.display.Button;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;

public class LPMainView extends Sprite {

    protected const FOOT_LBL:String="foot";
    protected const HEADER_BG_LBL:String="cabecera";
    protected const LOGO_LBL:String="logo";
    protected const PORTADA_LBL:String="portada";
    protected const VIDEO_LBL:String="video";
    protected const RADIO_LBL:String="radio";
    protected const TWITTER_LBL:String="twitter";

    protected const PARTICIPA_LBL:String="participa";
    protected const BACK_LBL:String="volver";
    protected const RELOAD_LBL:String="reload";
    protected const FB_LBL:String="facebook";

    protected const ON_LBL:String="_on";

    protected const FOOT_MARGIN:Point=new Point(4,-6);

    protected var _assetManager:CustomAssetManager;
    protected var _headerBGImg:Image;
    protected var _logoImg:Button;
    protected var _footerBGImg:Image;
    protected var _backBtn:Button;
    protected var _reloadBtn:Button;

    protected var _portadasBtn:Button;
    protected var _videoBtn:Button;
    protected var _radioBtn:Button;
    protected var _twitterBtn:Button;
    protected var _participaBtn:Button;


    public function get stageWidth():int{
        return StarlingUtils.stageSize.x;
    }
    public function get stageHeight():int{
        return StarlingUtils.stageSize.y;
    }

    public function LPMainView() {
        _assetManager=new CustomAssetManager();
        _assetManager.verbose=LPConstants.DEBUG_MODE;
        _assetManager.enqueue(File.applicationDirectory.resolvePath("assets/"));
        _assetManager.load(this,onLoad);
    }

    protected function onLoad():void{
        drawHeader();
        drawFooter();
        dispatchEventWith(LPEventTypes.LOADED);
    }

    protected function drawHeader():void{
        _headerBGImg=new Image(_assetManager.getTexture(HEADER_BG_LBL));
        addChild(_headerBGImg);
        _headerBGImg.width=stageWidth;

        _logoImg=new Button(_assetManager.getTexture(LOGO_LBL));
        _logoImg.alignPivot();
        _logoImg.x=StarlingUtils.stageCenter.x;
        _logoImg.y=_logoImg.height/2;
        _logoImg.addEventListener(Event.TRIGGERED,onTop);
        addChild(_logoImg);

        _backBtn=new Button(_assetManager.getTexture(BACK_LBL),"",_assetManager.getTexture(BACK_LBL+ON_LBL));
        addChild(_backBtn);
        _backBtn.addEventListener(Event.TRIGGERED,onBack);

        _reloadBtn=new Button(_assetManager.getTexture(RELOAD_LBL),"",_assetManager.getTexture(RELOAD_LBL+ON_LBL));
        _reloadBtn.x=stageWidth-_reloadBtn.width;
        addChild(_reloadBtn);
        _reloadBtn.addEventListener(Event.TRIGGERED,onBack);

    }
    protected function drawFooter():void{
        _footerBGImg=new Image(_assetManager.getTexture(FOOT_LBL));
        _footerBGImg.width=stageWidth;
        _footerBGImg.y=stageHeight-_footerBGImg.height;
        addChild(_footerBGImg);

        _portadasBtn =new Button(_assetManager.getTexture(PORTADA_LBL),"",_assetManager.getTexture(PORTADA_LBL+ON_LBL));
        addChild(_portadasBtn);
        _portadasBtn.x=FOOT_MARGIN.x;
        _portadasBtn.addEventListener(Event.TRIGGERED,onPortadas);

        _videoBtn =new Button(_assetManager.getTexture(VIDEO_LBL),"",_assetManager.getTexture(VIDEO_LBL+ON_LBL));
        addChild(_videoBtn);
        _videoBtn.x=_portadasBtn.x+_portadasBtn.width+1;
        _videoBtn.addEventListener(Event.TRIGGERED,onVideo);

        _radioBtn =new Button(_assetManager.getTexture(RADIO_LBL),"",_assetManager.getTexture(RADIO_LBL+ON_LBL));
        addChild(_radioBtn);
        _radioBtn.x=_videoBtn.x+_videoBtn.width+1;
        _radioBtn.addEventListener(Event.TRIGGERED,onRadio);

        _twitterBtn =new Button(_assetManager.getTexture(PORTADA_LBL),"",_assetManager.getTexture(PORTADA_LBL+ON_LBL));
        addChild(_twitterBtn);
        _twitterBtn.x=_radioBtn.x+_radioBtn.width+1;
        _twitterBtn.addEventListener(Event.TRIGGERED,onTwitter);

        _participaBtn =new Button(_assetManager.getTexture(PARTICIPA_LBL),"",_assetManager.getTexture(PARTICIPA_LBL+ON_LBL));
        addChild(_participaBtn);
        _participaBtn.x=_twitterBtn.x+_twitterBtn.width+1;
        _participaBtn.addEventListener(Event.TRIGGERED,onParticipa);

        _portadasBtn.y=_twitterBtn.y=_participaBtn.y=_videoBtn.y=_radioBtn.y=(_footerBGImg.y+FOOT_MARGIN.y);


    }

    private function onBack():void{
        dispatchEventWith(LPEventTypes.BACK);
    }
    private function onReload():void{
        dispatchEventWith(LPEventTypes.RELOAD);
    }
    private function onTop():void{
        dispatchEventWith(LPEventTypes.TOP);
    }

    private function onPortadas():void{
        dispatchEventWith(LPEventTypes.PORTADAS);
    }
    private function onVideo():void{
        dispatchEventWith(LPEventTypes.VIDEO);
    }
    private function onRadio():void{
        dispatchEventWith(LPEventTypes.RADIO);
    }
    private function onTwitter():void{
        dispatchEventWith(LPEventTypes.TWITTER);
    }
    private function onParticipa():void{
        dispatchEventWith(LPEventTypes.PARTICIPA);
    }



    public function enableBack(value:Boolean):void{
        _backBtn.visible=value;
    }
    public function enableReload(value:Boolean):void{
        _reloadBtn.visible=value;
    }

}
}
