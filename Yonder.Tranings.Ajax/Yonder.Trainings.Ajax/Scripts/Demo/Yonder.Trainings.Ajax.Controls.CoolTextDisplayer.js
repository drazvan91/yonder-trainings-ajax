Type.registerNamespace("Yonder.Trainings.Ajax.Controls");

Yonder.Trainings.Ajax.Controls.CoolTextDisplayer = function (element) {
    Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.initializeBase(this, [element]);

    this._hoverCssClass = null;
}

Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.prototype = {
    // properties
    'set_hoverCssClass': function(value){
        this._hoverCssClass = value;
    },
    'get_hoverCssClass': function(){
        return this._hoverCssClass;
    },

    // events
    'add_onHover': function(f){ 
        this.get_events().addHandler('onHover', f);
    },
    'remove_onHover': function(f){
        this.get_events().removeHandler('onHover', f);
    },
    'add_onLeave': function(f){
        this.get_events().addHandler("onLeave", f);
    },
    'remove_onLeave': function(f){
        this.get_events().removeHandler("onLeave", f);
    },

    // private methods
    '_onHover': function () {
        var cssClass = this.get_hoverCssClass();
        if (cssClass) {
            this.addCssClass(cssClass);
        }

        var handler = this.get_events().getHandler('onHover');
        if (handler != null) {
            handler(this, Sys.EventArgs.Empty);
        }
    },
    '_onLeave': function () {
        var cssClass = this.get_hoverCssClass();
        if (cssClass) {
            this.removeCssClass(this.get_hoverCssClass());
        }

        var handler = this.get_events().getHandler('onLeave');
        if (handler != null) {
            handler(this, Sys.EventArgs.Empty);
        }
    },

    // overriden methods
    'initialize': function () {
        Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.callBaseMethod(this, 'initialize');

        $addHandlers(this.get_element(),
            {
                'mouseover': this._onHover,
                'mouseleave': this._onLeave
            },
            this);
    },
    'dispose': function () {
        var jElement = $(this.get_element());
        jElement.text("disposed");

        $clearHandlers(this.get_element());
        Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.callBaseMethod(this, 'dispose');
    }
}

Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.registerClass('Yonder.Trainings.Ajax.Controls.CoolTextDisplayer', Yonder.Trainings.Ajax.Controls.TextDisplayer);

// Notify the ScriptManager that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
