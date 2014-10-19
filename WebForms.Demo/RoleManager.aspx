<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleManager.aspx.cs" Inherits="WebForms.Demo.RoleManager" %>
<asp:Content runat="server" ID="ContentHeader" ContentPlaceHolderID="HeaderContent">
    <style type="text/css">
        .form-group .form-control {
            width: 33%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Roles</h2>
    <h4>New role</h4>
    <div class="form-group">
        <label class="sr-only" for="newRole">Role name:</label>
        <input class="form-control" id="newRole" data-bind="value: newRole" />
    </div>
    <button type="button" class="btn btn-default" data-bind="click: addRole">Add</button>
    <div data-bind="visible: roles().length === 0">
        <h4>No roles defined</h4>
    </div>
    <div data-bind="visible: roles().length > 0">
        <h4>Existing roles:</h4>
        <ul data-bind="foreach: roles">
            <li><span data-bind="text: $data"></span>&nbsp;<button type="button" class="btn btn-default" data-bind="click: $root.addMe">Add me to this group</button></li>
        </ul>
    </div>
    <script src="/Scripts/knockout-3.2.0.js"></script>
    <script type="text/javascript">
        (function () {
            var defaultAjaxSettings = {
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST'
            };

            var ViewModel = function () {
                var self = this;
                self.roles = ko.observableArray();
                self.newRole = ko.observable('');

                self.loadRoles = function () {
                    $.ajax('RoleManager.aspx/GetRoles', defaultAjaxSettings).
                      done(function (data) {
                        if (data && data.d && $.isArray(data.d)) {
                            for (var i = 0; i < data.d.length; i++) {
                                self.roles.push(data.d[i]);
                            }
                        }
                    });
                };

                self.addRole = function () {
                    $.ajax('RoleManager.aspx/AddRole', $.extend(defaultAjaxSettings, { data: JSON.stringify({ name: self.newRole() }) })).
                      done(function () {
                        self.roles.push(self.newRole());
                        self.newRole('');
                    });
                };

                self.addMe = function (role) {
                    $.ajax('RoleManager.aspx/AddMeToRole', $.extend(defaultAjaxSettings, { data: JSON.stringify({ name: role }) }));
                };
            };

            var vm = new ViewModel();
            ko.applyBindings(vm);

            vm.loadRoles();
        })();
    </script>
</asp:Content>
