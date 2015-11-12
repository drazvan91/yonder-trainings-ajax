<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Path="~/Scripts/Demo/Yonder.Trainings.Ajax.Controls.TextDisplayer.js" />
            </Scripts>
        </asp:ScriptManager>

        <div>
            <input id="updateTimeButton" type="button" value="Update time" />
            <span id="textDisplayer1"></span>
        </div>

        <script>
            var app = Sys.Application;
            app.add_init(applicationInitHandler);

            function applicationInitHandler(sender, args) {
                var domElement1 = $get("textDisplayer1");
                var textDisplayer1 = $create(Yonder.Trainings.Ajax.Controls.TextDisplayer, { text: "no click yet" }, {}, null, domElement1);

                $("#updateTimeButton").on('click', function () {
                    var d = new Date();
                    textDisplayer1.set_text(d.toLocaleTimeString());
                });
            }
        </script>
    </form>
</body>
</html>
