using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using Dominio;

namespace CatalogoWebMaxP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            UsersNegocio negocio = new UsersNegocio();
            Users usuario = new Users();

            usuario.Email = txtEmail.Text;
            usuario.Password = txtPassword.Text;
            try
            {
                if(negocio.Login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("/MiPerfil.aspx",false);
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("/Error.aspx", false);
                }
            }
            catch (Exception ex) 
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx", false);
            }
        }
    }
}