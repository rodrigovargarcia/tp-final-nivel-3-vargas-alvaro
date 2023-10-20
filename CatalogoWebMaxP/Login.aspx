<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CatalogoWebMaxP.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-3 mt-3">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-4 mb-3 mt-3 text-center">
                <h2>Ingresa con tu usuario</h2>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-4 mb-3 mt-3">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                    <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El email es requerido" ControlToValidate="txtEmail" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" ID="txtPassword" type="password" CssClass="form-control" />
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row justify-content-center align-items-center mb-3">
            <div class="col-md-2 text-center">
                <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnIngresar" OnClick="btnIngresar_Click" runat="server" />
            </div>
            <div class="col-md-2 text-center">
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
        <div class="row justify-content-center align-items-center">
            <div class="col-md-4 text-center">                
                <a href="Registro.aspx">¿Aún no tienes cuenta?</a>
            </div>
        </div>
    </div>
</asp:Content>
