<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CatalogoWebMaxP.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row py-5">
            <h2>Productos</h2>
        </div>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater runat="server" ID="repRepetidor">
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 mb-4">
                        <div class="card h-100 overflow-auto">
                            <img class="card-img-top" src="<%#Eval("ImagenUrl") %>" alt="Alternate Text" />
                            <div class="card-body d-flex flex-column">
                                <div class="mt-auto">
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                    <p class="card-text"><%#Eval("Descripcion") %></p>
                                    <div class="row" style="justify-content: space-between;">
                                        <div class="col-4">
                                            <p class="card-text mt-2"><%#Eval("Precio") %></p>
                                        </div>
                                        <%--<%if (negocio.Seguridad.sesionActiva(Session["usuario"]))
                                        {%>--%>
                                        <div class="col-6 text-end">
                                            <asp:Button Text="♥" CssClass="btn btn-primary" ID="btnAgregaFavorito" CommandName="ArticuloId" CommandArgument='<%#Eval("Id") %>' OnClick="btnAgregaFavorito_Click" runat="server" />
                                        </div>                                        
                                        <%--<%%>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    </div>
</asp:Content>
