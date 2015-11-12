using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

[assembly: WebResource("Yonder.Trainings.Ajax.Controls.ClickCounter.js", "text/javascript")]
namespace Yonder.Trainings.Ajax.Controls
{
    public class ClickCounter: WebControl, IScriptControl, IPostBackDataHandler, IPostBackEventHandler
    {
        private int _value = 0;
        public int Value 
        {
            get{return _value;}
            set
            {
                var oldValue = _value;
                _value = value;
                if (oldValue != value)
                {
                    ValueChanged(this, new EventArgs());
                }
            }
        }
        public bool AutoPostback { get; set; }

        public event EventHandler ValueChanged = (s,e)=>{ };

        public event EventHandler LeftClicked = (s, e) => { };
        public event EventHandler RightClicked = (s, e) => { };

        public IEnumerable<ScriptDescriptor> GetScriptDescriptors()
        {
            var descriptor = new ScriptControlDescriptor("Yonder.Trainings.Ajax.Controls.ClickCounter", this.ClientID);
            descriptor.AddProperty("value", this.Value);
            descriptor.AddProperty("autoPostback", this.AutoPostback);

            return new ScriptDescriptor[]{descriptor};
        }

        public IEnumerable<ScriptReference> GetScriptReferences()
        {
            yield return new ScriptReference()
            {
                Name = "jquery"
            };
            yield return new ScriptReference()
            {
                
                Assembly = "Yonder.Trainings.Ajax.Controls",
                Name = "Yonder.Trainings.Ajax.Controls.ClickCounter.js"
            };
        }

        protected override void OnPreRender(EventArgs e)
        {
            var sm = ScriptManager.GetCurrent(Page);

            if (sm == null)
                throw new HttpException("A ScriptManager control must exist on the current page.");

            sm.RegisterScriptControl(this);
            base.OnPreRender(e);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            var sm = ScriptManager.GetCurrent(Page);
            sm.RegisterScriptDescriptors(this);
            
            base.Render(writer);
        }

        public bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection)
        {
            var stringValue = postCollection[postDataKey];
            if (stringValue == null)
            {
                return false;
            }

            int value = 0;
            if (int.TryParse(stringValue, out value))
            {
                this.Value = value;
                return true;
            }

            return false;
        }

        public void RaisePostDataChangedEvent()
        {
            
        }

        public void RaisePostBackEvent(string eventArgument)
        {
            if (eventArgument == "postback_leftClick")
            {
                LeftClicked(this, EventArgs.Empty);
                return;
            }
            else if (eventArgument == "postback_rightClick")
            {
                RightClicked(this, EventArgs.Empty);
                return;
            }

            throw new NotSupportedException(eventArgument + " event argument is not supported");
        }
    }
}
