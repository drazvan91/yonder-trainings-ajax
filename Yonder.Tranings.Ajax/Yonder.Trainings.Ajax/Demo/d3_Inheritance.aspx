<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="Yonder.Trainings.Ajax.Controls" Namespace="Yonder.Trainings.Ajax.Controls" TagPrefix="demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .text-displayer-hover{
            background-color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
            </Scripts>
        </asp:ScriptManager>
    <div>
        <div>
        <input id="updateTimeButton" type="button" value="Update time" />
        <demo:CoolTextDisplayer ID="textDisplayer" runat="server" HoverCssClass="text-displayer-hover" Text="again, not clicked yet" />
        </div>
        <input id="disposeButton" type="button" value="Dispose" />
        <div id="textDisplayerStatus">Unknown</div>

    </div>
        <script>
            var app = Sys.Application;
            app.add_load(applicationLoaded);

            function applicationLoaded(sender, args) {
                var textDisplayer1 = $find('<%=textDisplayer.ClientID%>');
                var displayerStatus = $("#textDisplayerStatus");

                textDisplayer1.add_onHover(function () {
                    displayerStatus.text("hover");
                });
                textDisplayer1.add_onLeave(function () {
                    displayerStatus.text("leave");
                })

                $("#updateTimeButton").on('click', function () {
                    var d = new Date();
                    textDisplayer1.set_text(d.toLocaleTimeString());
                });

                $("#disposeButton").on('click', function () {
                    textDisplayer1.dispose();
                });
            }
        </script>
    </form>
</body>
</html>
