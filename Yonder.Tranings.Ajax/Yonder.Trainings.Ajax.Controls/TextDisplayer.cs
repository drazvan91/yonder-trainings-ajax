using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Yonder.Trainings.Ajax.Controls
{
    public class TextDisplayer : ScriptControl
    {
		public string Text{ get;set; }

        protected override IEnumerable<ScriptDescriptor> GetScriptDescriptors()
        {
            var descriptor = new ScriptControlDescriptor("Yonder.Trainings.Ajax.Controls.TextDisplayer", this.ClientID);
            descriptor.AddProperty("text", this.Text);

            return new ScriptDescriptor[] { descriptor };
        }
  
        protected override IEnumerable<ScriptReference> GetScriptReferences()
        {
            yield return new ScriptReference()
            { 
                Name = "jquery"
            };
            yield return new ScriptReference(){
				Path = "~/Scripts/Demo/Yonder.Trainings.Ajax.Controls.TextDisplayer.js"
			};
        }
    }
}
