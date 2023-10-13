<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ListadoProductos.aspx.cs" Inherits="CatalogoWebMaxP.ListadoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row py-5 mb-3">
            <div class="col-md-4">
                <h1>Listado de productos</h1>
            </div>
        </div>
    </div>
    <div class="container mt-3 mb-3">
        <div class="row">
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" PlaceHolder="Filtro Rapido" OnTextChanged="txtFiltro_TextChanged" AutoPostBack="true" />
            </div>
            <div class="col-md-4 mt-2">
                <asp:CheckBox Text="Filtro Avanzado" ID="chkFiltroAvanzado" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" AutoPostBack="true" runat="server" />
            </div>
        </div>
    </div>
    <%if (chkFiltroAvanzado.Checked)
        {
            txtFiltro.Enabled = false;
            %>
        <div class="container mt-3 mb-3">  
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Codigo" />
                            <asp:ListItem Text="Precio" />
                            <asp:ListItem Text="Marca"/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList ID="ddlCriterio" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroAvanzado"/>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3 mt-4">
                        <asp:Button Text="Buscar" ID="btnBuscarAvanzado" CssClass="btn btn-primary" OnClick="btnBuscarAvanzado_Click" runat="server" />
                    </div>
                </div>
            </div>  
        </div>
           <%}%>
    <div class="container mt-3">
        <div class="row">
            <asp:GridView runat="server" AutoGenerateColumns="false" ID="dgvProductos" CssClass="table"
                DataKeyNames="Id" OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged" AllowPaging="true"
                OnPageIndexChanging="dgvProductos_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:BoundField HeaderText="Articulo" DataField="Nombre" />
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />                    
                    <asp:TemplateField HeaderText="Editar" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnSelect" runat="server" CommandName="Select">
                                <i class="fas fa-edit" style="color:cornflowerblue"></i>  
                            </asp:LinkButton>                            
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>
            </asp:GridView>            
        </div>
    </div>
    <div class="container">
        <div class="row py-5 mb-3">
            <div class="col-md-4">
                <a href="FormularioProductos.aspx" class="btn btn-primary">Agregar</a>
            </div>
        </div>
    </div>
</asp:Content>
