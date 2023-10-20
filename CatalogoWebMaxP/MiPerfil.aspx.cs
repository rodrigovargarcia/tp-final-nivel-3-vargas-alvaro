using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CatalogoWebMaxP
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Users user = (Users)Session["usuario"];
                if (Seguridad.sesionActiva(Session["usuario"]) && !IsPostBack)
                {                
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    if(user.ImagenPerfil != null)
                        imgNuevoPerfil.ImageUrl = "/Images/" + user.ImagenPerfil;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {            
            Users user = (Users)Session["usuario"];
            string ruta = Server.MapPath("./Images/");
            UsersNegocio negocio = new UsersNegocio();
            txtImagenPerfil.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");            
            try
            {
                // Escribimos img
                user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.Actualizar(user);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }
    }
}