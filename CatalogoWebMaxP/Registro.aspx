<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="CatalogoWebMaxP.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container mb-3 mt-3">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-4 mb-3 mt-3 text-center">
                <h2>Completa con tus datos</h2>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-4 mb-3 mt-3">
                <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <asp:TextBox runat="server" ID="txtPassword" type="password" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Repita la contraseña</label>
                            <asp:TextBox runat="server" ID="txtPassword2" type="password" AutoPostBack="true" OnTextChanged="txtPassword2_TextChanged" CssClass="form-control" />
                        </div>
                        <asp:Label Text="Las contraseñas no coinciden" ID="lblCompruebaPass" BorderColor="Red" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container mt-3">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-2 text-center">
                        <asp:Button Text="Crear cuenta" CssClass="btn btn-success" ID="btnRegistrarse" Enabled="false" OnClick="btnRegistrarse_Click" runat="server" />
                    </div>
                    <div class="col-md-2 text-center">
                        <a href="Default.aspx">Cancelar</a>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
