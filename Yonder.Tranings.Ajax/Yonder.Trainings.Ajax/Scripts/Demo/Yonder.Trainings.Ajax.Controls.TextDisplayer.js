Type.registerNamespace("Yonder.Trainings.Ajax.Controls");

Yonder.Trainings.Ajax.Controls.TextDisplayer = function (element) {
   
    Yonder.Trainings.Ajax.Controls.TextDisplayer.initializeBase(this, [element]);

    this._text = "no text";
}

Yonder.Trainings.Ajax.Controls.TextDisplayer.prototype = {
    // properties
    'set_text': function (value) {
        this._text = value;

        //if (this.get_isInitialized()) {
            this._updateUI();
        //}
    },
    'get_text': function () {
        return this._text;
    },

    // private stuff
    '_updateUI': function () {
        var domElement = this.get_element();
        var jElement = $(domElement);
        jElement.text(this.get_text());
    },

    

    // overriden methods
    'initialize': function () {
        Yonder.Trainings.Ajax.Controls.TextDisplayer.callBaseMethod(this, 'initialize');

        this._updateUI();
    }
}

Yonder.Trainings.Ajax.Controls.TextDisplayer.registerClass('Yonder.Trainings.Ajax.Controls.TextDisplayer', Sys.UI.Control);

// Notify the ScriptManager that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
