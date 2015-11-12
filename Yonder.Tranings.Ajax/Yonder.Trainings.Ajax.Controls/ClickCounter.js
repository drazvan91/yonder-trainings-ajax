Type.registerNamespace("Yonder.Trainings.Ajax.Controls");

Yonder.Trainings.Ajax.Controls.ClickCounter = function (element) {
    Yonder.Trainings.Ajax.Controls.ClickCounter.initializeBase(this, [element]);

    this._value = 0;
    this._autoPostback = false;
    
    this._textElement = null;
    this._hiddenElement = null;
}

Yonder.Trainings.Ajax.Controls.ClickCounter.prototype = {
    'set_value': function (value) {
        this._value = value;

        if (this.get_isInitialized()) {
            this._updateDom();
        }
    },
    'get_value': function () {
        return this._value;
    },
    'set_autoPostback': function(value){
        this._autoPostback = value;
    },
    'get_autoPostback': function(){
        return this._autoPostback;
    },

    '_createInnerElements': function(){
        var hiddenHtml = String.format("<input type='hidden' name='{0}' value='{1}'></input>",
            this.get_id(),
            this.get_value());
        this._hiddenElement = $(hiddenHtml);
        this._hiddenElement.appendTo(this.get_element());

        this._textElement = $(String.format("<span>{0}</span>", this.get_value()));
        this._textElement.appendTo(this.get_element());
    },
    '_updateDom': function(){
        this._textElement.text(this.get_value());
        this._hiddenElement.val(this.get_value());
    },
    '_onClick': function () {
        var value = this.get_value();
        value++;
        this.set_value(value);

        if (this.get_autoPostback()) {
            __doPostBack(this.get_id(), 'postback_leftClick');
        }
    },

    // overriden methods
    'initialize': function () {
        Yonder.Trainings.Ajax.Controls.ClickCounter.callBaseMethod(this, 'initialize');

        this._createInnerElements();
        this._updateDom();

        $addHandlers(this.get_element(),
            {
                'click': this._onClick
            },
            this);
    },
    'dispose': function () {
        $clearHandlers(this.get_element());

        Yonder.Trainings.Ajax.Controls.ClickCounter.callBaseMethod(this, 'dispose');
    }
}

Yonder.Trainings.Ajax.Controls.ClickCounter.registerClass('Yonder.Trainings.Ajax.Controls.ClickCounter', Sys.UI.Control);

// Notify the ScriptManager that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
