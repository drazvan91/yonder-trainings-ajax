using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace Yonder.Trainings.Ajax.Controls
{
    public class CoolTextDisplayer:TextDisplayer
    {
        public string HoverCssClass { get; set; }

        protected override IEnumerable<ScriptDescriptor> GetScriptDescriptors()
        {
            var descriptor = new ScriptControlDescriptor("Yonder.Trainings.Ajax.Controls.CoolTextDisplayer", this.ClientID);
            descriptor.AddProperty("text", this.Text);
            descriptor.AddProperty("hoverCssClass", this.HoverCssClass);

            return new ScriptDescriptor[] { descriptor };
        }

        protected override IEnumerable<System.Web.UI.ScriptReference> GetScriptReferences()
        {
            foreach (var script in base.GetScriptReferences())
            {
                yield return script;
            }

            yield return new ScriptReference("~/Scripts/Demo/Yonder.Trainings.Ajax.Controls.CoolTextDisplayer.js");
        }
    }
}
