<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <script>
            Type.registerNamespace("Yonder.Demo");

            Yonder.Demo.Person = function (name, age) {
                this._name = name;
                this._age = age;
            }

            Yonder.Demo.Person.prototype = {
                "set_name": function (value) {
                    this._name = value;
                },
                "get_name": function () {
                    return this._name;
                },
                "set_age": function (value) {
                    this._age = value;
                },
                "get_age": function () {
                    return this._age;
                },

                "sayHello": function(){
                    return "Hello from Person";
                }
            }

            Yonder.Demo.Person.registerClass("Yonder.Demo.Person", null, null);

            var person = new Yonder.Demo.Person("Ana", 23);
            console.log(person.get_name());
            
        </script>
        <script>
            
            Yonder.Demo.Employee = function (name, age, company) {
                Yonder.Demo.Employee.initializeBase(this, [name, age]);

                this._company = company;
            }

            Yonder.Demo.Employee.prototype = {
                "get_company": function () {
                    return this._company;
                },

                "sayHello": function () {
                    var message = Yonder.Demo.Employee.callBaseMethod(this, "sayHello");
                    return message + "\r\nHello from Employee";
                }
            }

            Yonder.Demo.Employee.registerClass("Yonder.Demo.Employee", Yonder.Demo.Person);

            var employee = new Yonder.Demo.Employee("Mihai", 30, "Yonder");
            console.log(employee.sayHello());
            
        </script>

        <script>
            Yonder.Demo.IList = function () { }
            Yonder.Demo.IList.prototype = {
                add: function (element) { },
                remove: function (element) { },
                removeAt: function (index) { },
                clear: function () { },
                get: function (index) { }
            }
            Yonder.Demo.IList.registerInterface("Yonder.Demo.IList");
        </script>

        <script>
            Yonder.Demo.PersonStatus = function () { };
            Yonder.Demo.PersonStatus.prototype = {
                Employed: 1,
                Unemployed: 2
            };
            Yonder.Demo.PersonStatus.registerEnum("Yonder.Demo.PersonStatus");

            console.log(Yonder.Demo.PersonStatus.Employed);
        </script>

        <script>
            // a bit of reflection
            var employeeType = Yonder.Demo.Employee;
            console.log(employeeType.getName());

            var employee = new Yonder.Demo.Employee("Ioan", 33, "Yonder");
            employeeType.isInstanceOfType(employee);


        </script>
    </form>
</body>
</html>
