using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace CatalogoWebMaxP
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCompruebaPass.Visible = false;
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                UsersNegocio negocio = new UsersNegocio();
                Users usuario = new Users();
                usuario.Nombre = txtNombre.Text;
                usuario.Email = txtEmail.Text;
                usuario.Password = txtPassword.Text;
                usuario.Apellido = txtApellido.Text;

                int id = negocio.nuevoUsuario(usuario);
                usuario.Id = id;
                Session.Add("usuario", usuario);
                Response.Redirect("/Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());                
                Response.Redirect("/Error.aspx");
            }           
        }

        protected void txtPassword2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string password1 = txtPassword.Text;
                string password2 = txtPassword2.Text;
                if(!(password1 == password2))
                {             
                    lblCompruebaPass.Visible = true;
                    btnRegistrarse.Enabled = false;
                }
                else
                {
                    UsersNegocio negocio = new UsersNegocio();
                    negocio.coincidenPass();
                    btnRegistrarse.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }
    }
}