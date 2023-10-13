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
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            try
            {
                if (Session["categoriaSeleccionada"] == null && !(IsPostBack))
                {
                    ListaArticulos = articulos.listar();
                    repRepetidor.DataSource = ListaArticulos;
                    repRepetidor.DataBind();
                }
                else if (Session["categoriaSeleccionada"] != null)
                {                
                    repRepetidor.DataSource = Session["categoriaSeleccionada"];
                    repRepetidor.DataBind();
                    Session.Remove("categoriaSeleccionada");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void btnAgregaFavorito_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                {                    
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    FavoritosNegocio negocio = new FavoritosNegocio();
                    ArticuloFavorito favorito = new ArticuloFavorito();
                    Users user = (Users)Session["usuario"];         
                    
                    string idArticulo = ((Button)sender).CommandArgument;

                    favorito.IdArticulo = int.Parse(idArticulo);
                    favorito.IdUser = user.Id;
                    //favorito.IdUser = int.Parse(Session["usuario"].ToString());
                    
                    negocio.agregarFavorito(favorito);

                    string script = @"Swal.fire({
                        title: 'Artículo agregado a Favoritos',
                        icon: 'success',
                        position: 'top-end',
                        });";
                    ScriptManager.RegisterStartupScript(this, GetType(), "agregaFavorito", script, true);
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