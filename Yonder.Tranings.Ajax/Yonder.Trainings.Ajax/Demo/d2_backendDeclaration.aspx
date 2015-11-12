<%@ Page Language="C#" AutoEventWireup="true"  %>

<%@ Register Assembly="Yonder.Trainings.Ajax.Controls" Namespace="Yonder.Trainings.Ajax.Controls" TagPrefix="demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
            </Scripts>
        </asp:ScriptManager>
    <div>
        <input id="updateTimeButton" type="button" value="Update time" />
        <demo:TextDisplayer ID="textDisplayer" runat="server" Text="again, not clicked yet" />
    </div>
        <script>
            var app = Sys.Application;
            app.add_load(applicationLoaded);

            function applicationLoaded(sender, args) {
                var textDisplayer1 = $find('<%=textDisplayer.ClientID%>');

                $("#updateTimeButton").on('click', function () {
                    var d = new Date();
                    textDisplayer1.set_text(d.toLocaleTimeString());
                });
            }
        </script>
    </form>
</body>
</html>
