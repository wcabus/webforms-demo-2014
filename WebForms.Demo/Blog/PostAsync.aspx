<%@ Page Title="Blog" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostAsync.aspx.cs" Inherits="WebForms.Demo.Blog.PostAsync" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
    <style>
        label {
            display: inline;
            padding-left: 1em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>New Post</h1>
    <div>Categories:<br />
        <asp:CheckBoxList runat="server" ID="postCategories"></asp:CheckBoxList>
    </div>
    <asp:UpdatePanel runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnClear" />
        </Triggers>
        <ContentTemplate>
            <asp:Button runat="server" ID="btnClear" OnClick="ClearCache" Text="Clear Cache" CssClass="btn btn-default" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
