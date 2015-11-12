<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="Yonder.Trainings.Ajax.Controls" Namespace="Yonder.Trainings.Ajax.Controls" TagPrefix="demo" %>

<script runat="server">
    protected void Page_Init(object sender, EventArgs e)
    {
        this.counter1.ValueChanged += counter1_ValueChanged;
    }

    void counter1_ValueChanged(object sender, EventArgs e) 
    {
        this.lastValueLabel.Text = this.counter1.Value.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void okButton_Click(object sender, EventArgs e)
    {
        this.dateLabel.Text = DateTime.Now.ToLongTimeString();
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
                
        </asp:ScriptManager>
    <div>

    Clicked:<demo:ClickCounter runat="server" ID="counter1" AutoPostback="True" /><br />
    LastValue: <asp:Label runat="server" ID="lastValueLabel" Text="0" /><br />

    <asp:Button runat="server" ID="okButton" Text="Update time" OnClick="okButton_Click" /><br />
    
    Date: <asp:Label runat="server" ID="dateLabel" />
    
    </div>
    </form>
</body>
</html>
