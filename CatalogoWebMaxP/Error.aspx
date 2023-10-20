<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CatalogoWebMaxP.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row py-5">
            <div class="col-6">
                <h1>Error</h1>
                <asp:Label Text="Error" ID="lblMensaje" runat="server" />
            </div>
            <div class="col-6 mt-4">
                <asp:Button Text="Regresar" runat="server" ID="btnError" OnClick="btnError_Click" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>
</asp:Content>
