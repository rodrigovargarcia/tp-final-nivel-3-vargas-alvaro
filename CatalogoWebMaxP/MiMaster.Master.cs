using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace CatalogoWebMaxP
{
    public partial class MiMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Error || Page is Login || Page is Registro || Page is Default || Page is VerDetalle))
            {
                if (!(Seguridad.sesionActiva(Session["usuario"])))
                    Response.Redirect("Login.aspx", false);
            }
        }

        protected void btnCelularesDll_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            Session.Add("categoriaSeleccionada", negocio.listarCelular());
            Response.Redirect("Default.aspx");
        }

        protected void btnTelevisoresDll_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            Session.Add("categoriaSeleccionada", negocio.listarTelevisor());
            Response.Redirect("Default.aspx");
        }

        protected void btnMediaDll_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            Session.Add("categoriaSeleccionada", negocio.listarMedia());
            Response.Redirect("Default.aspx");
        }

        protected void btnAudioDll_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            Session.Add("categoriaSeleccionada", negocio.listarAudio());
            Response.Redirect("Default.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/Default.aspx");
        }
    }
}