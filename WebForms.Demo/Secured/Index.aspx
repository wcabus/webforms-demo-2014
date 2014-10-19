<%@ Page Title="WebFormsDemo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebForms.Demo.Secured.Index" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup>
        <h1><%: Title %>.</h1>
        <h2>Welcome to the secure area.</h2>
    </hgroup>
    <p>You clearly have access.</p>
</asp:Content>