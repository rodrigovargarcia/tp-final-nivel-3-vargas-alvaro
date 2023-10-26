<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="FormularioProductos.aspx.cs" Inherits="CatalogoWebMaxP.FormularioProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="SriptManager1" />
    <div class="container">
        <h1>Producto:
            <asp:Label ID="lblNombreProd" runat="server" /></h1>
    </div>
    <div class="container">
        <div class="row py-5 mb-3">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes completar este campo" ControlToValidate="txtNombre" BorderColor="Red" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtCodigo" class="form-label">Codigo</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes completar este campo" BorderColor="Red" ControlToValidate="txtPrecio" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoria:</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="txtImagen" class="form-label">Imagen</label>
                            <asp:TextBox runat="server" ID="txtImagen" AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Image ID="imgProducto" ImageUrl="https://codigogenesis.com/genesis/2020/01/modificar-resolucion-subir-imagenes-WordPress.png" Width="90%" runat="server" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row py-5 mb-3">
            <div class="col-md-4">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
            </div>
            <%if(!NoElimina)
            { %>
            <div class="col-md-4">
                <button type="button" class="btn btn-danger" CssClass="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Eliminar</button>
            </div>
            <% }%>
        </div>

        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">¡Cuidado!</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        ¿Estás seguro de eliminar este artículo?<br />
                        Si continúa, el artículo se eliminará permanentemente.
                    </div>
                    <div class="modal-footer justify-content-between">
                        <asp:Button Text="Si" ID="btnConfirmaEliminacion" CssClass="btn btn-danger" OnClick="btnConfirmaEliminacion_Click" runat="server" />
                        <a href="/ListadoProductos.aspx" class="btn btn-secondary">Cancelar</a>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</asp:Content>
