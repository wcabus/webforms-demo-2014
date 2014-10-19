<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForms.Demo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1><%: Title %></h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div>
                The current time: <asp:Label ID="lblTime" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnUpdateActualTime" />
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateActualTimeAsync" />
                </Triggers>
                <ContentTemplate>
                    The actual time: <asp:Label ID="lblActualTime" runat="server" /><br /><br />
                    <asp:Button ID="btnUpdateActualTime" runat="server" Text="Update" OnClick="OnUpdateActualTime" CssClass="btn" /><br /><br />
                    <asp:Button ID="btnUpdateActualTimeAsync" runat="server" Text="Update (async)" OnClick="OnUpdateActualTime" CssClass="btn" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
