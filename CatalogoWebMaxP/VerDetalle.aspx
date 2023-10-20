<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="CatalogoWebMaxP.VerDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .label {
            font-size: 25px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Producto:
            <asp:Label ID="lblNombre" runat="server" /></h1>
    </div>
    <div class="container">
        <div class="row py-5 mb-3">
            <div class="col-6">
                <div class="mb-3">
                    <asp:Label Text="Id:" for="lblId" CssClass="label" runat="server" />
                    <asp:Label ID="lblId" style="font-size:20px" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Marca:" for="lblMarca" CssClass="label" runat="server" />
                    <asp:Label ID="lblMarca" style="font-size:20px" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Descripción:" for="lblDescripcion" CssClass="label" runat="server" />
                    <asp:Label ID="lblDescripcion" style="font-size:20px" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Precio:" for="lblPrecio" CssClass="label" runat="server" />
                    <asp:Label ID="lblPrecio" style="font-size:20px" runat="server" />
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <asp:Image ID="imgProducto" Width="90%" runat="server" />
                </div>
            </div>
        </div>
        <div class="row py-5 mb-3">
            <div class="col-3">
                <a href="/" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
    </div>
</asp:Content>
