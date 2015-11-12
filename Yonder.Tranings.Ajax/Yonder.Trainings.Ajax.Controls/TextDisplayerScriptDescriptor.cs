using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace Yonder.Trainings.Ajax.Controls
{
    internal class TextDisplayerScriptDescriptor:ScriptDescriptor
    {
        public string ControlId { get; set; }
        public string Text { get; set; }

        protected override string GetScript()
        {
            string template =
@"var domElement = $get('{0}');
$create(Yonder.Trainings.Ajax.Controls.TextDisplayer, { text: '{1}' }, {}, null, domElement1);";

            return string.Format(template, ControlId, Text);
        }
    }
}
