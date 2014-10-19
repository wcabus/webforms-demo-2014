<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ajax.aspx.cs" Inherits="WebForms.Demo.Ajax" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1><%: Title %></h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div>
                The current time: <asp:Label ID="lblTime" runat="server" />
            </div>
            <div>
                The actual time: <span id="actualTime"></span><br /><br />
                <button type="button" id="btnUpdateActualTime" class="btn">Update</button><br /><br />
                <button type="button" id="btnUpdate2" class="btn">Update (using promise)</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var options = {
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                type: 'POST'
            };

            function ajaxPost(url, data, onSuccess) {
                $.ajax(url, $.extend(options, {success: onSuccess}));
            }

            $('#btnUpdateActualTime').click(function () {
                ajaxPost('Ajax.aspx/GetTime', '', function (data) {
                        $('#actualTime').html(data.d);
                    }
                );
            });

            $('#btnUpdate2').click(function () {
                $.when($.ajax('Ajax.aspx/GetTime', options)).then(function (data) { $('#actualTime').html(data.d); });
            });
        });
    </script>
</asp:Content>
