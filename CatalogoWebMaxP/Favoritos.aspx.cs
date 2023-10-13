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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Seguridad.sesionActiva(Session["usuario"]) && !(IsPostBack))
                {
                    ArticulosNegocio articulos = new ArticulosNegocio();
                    Users user = (Users)Session["usuario"];

                    ListaArticulos = articulos.listarFavoritos(user.Id);

                    repRepetidorFavoritos.DataSource = ListaArticulos;
                    repRepetidorFavoritos.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void btnEliminarArtFav_Click(object sender, EventArgs e)
        {
            FavoritosNegocio negocio = new FavoritosNegocio();
            ArticuloFavorito favorito = new ArticuloFavorito();
            Users user = (Users)Session["usuario"];
            try
            {
                string ArticuloId = ((Button)sender).CommandArgument;
                favorito.IdArticulo = int.Parse(ArticuloId);
                favorito.IdUser = user.Id;

                negocio.eliminarFavorito(favorito);
                string script = @"Swal.fire({
                      position: 'top-end',
                      icon: 'warning',
                      title: 'Eliminaste el articulo',
                      showConfirmButton: false,                  
                    }).then(function(){
                    setTimeout(function(){
                        window.location.href = '" + Request.RawUrl + @"';
                        },1000);
                    });
                    ";            
                ScriptManager.RegisterStartupScript(this, GetType(), "agregaFavorito", script, true);            
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }
    }
}