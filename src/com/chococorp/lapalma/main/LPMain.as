/**
 * Created by sergio on 13/09/2014.
 */
package com.chococorp.lapalma.main {
import com.chococorp.lapalma.events.LPEventTypes;

import starling.display.Sprite;

public class LPMain extends Sprite{

    protected var _view:LPMainView;

    protected var _currentSection:Sprite;

    public function get view():LPMainView{
        return _view;
    }

    public function LPMain() {
        _view=new LPMainView();
        _view.addEventListener(LPEventTypes.LOADED,onMainLoaded);
        addChild(_view);
    }

    protected function onMainLoaded():void{
        showPortada();
    }

    protected function showPortada():void{
        disposeCurrentSection();
        _currentSection=new
    }


    protected function disposeCurrentSection():void{
        _view.removeChild(_currentSection,true);
    }

    override public function dispose():void{
        disposeCurrentSection();
        removeChild(_view,true);
        super.dispose();
    }
}
}
