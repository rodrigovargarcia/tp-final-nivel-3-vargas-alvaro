<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="CatalogoWebMaxP.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function mostrarImagen() {
            /*alert("Evento onchange se ha disparado");*/
            var input = document.getElementById("ContentPlaceHolder1_txtImagenPerfil");
            var img = document.getElementById("<%= imgNuevoPerfil.ClientID %>");

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    img.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Mi perfil</h2>
    <div class="container-fluid">
        <div class="row py-5">
                <div class="col-4">
                    <div class="col md-4">
                        <label class="form-label">Nombre</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                    </div>
                    <div class="col md-4">
                        <label class="form-label">Apellido</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
                    </div>
                </div>
            <div class="col-4">
                <div class="col md-4">
                    <div class="mb-3">
                        <label class="form-label">Imagen Perfil</label>
                        <input type="file" ID="txtImagenPerfil" runat="server" class="form-control" onchange="mostrarImagen()"/>
                    </div>
                    <asp:Image ImageUrl="https://us.123rf.com/450wm/thesomeday123/thesomeday1231709/thesomeday123170900021/85622928-icono-de-perfil-de-avatar-predeterminado-marcador-de-posici%C3%B3n-de-foto-gris-vectores-de.jpg" ID="imgNuevoPerfil" CssClass="img-fluid mb-3" runat="server" />
                </div>                
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
                <a href="/">Regresar</a>
            </div>
        </div>   
    </div>
</asp:Content>
