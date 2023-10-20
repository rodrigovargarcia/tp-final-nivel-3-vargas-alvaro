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
    public partial class VerDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				if (!IsPostBack)
				{
                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "" && !IsPostBack)
					{
                        ArticulosNegocio negocio = new ArticulosNegocio();
						Articulos articulo = (negocio.listar(id))[0];
						lblId.Text = id;
						lblNombre.Text = articulo.Nombre;
						lblMarca.Text = articulo.Marca.Id.ToString();
						lblDescripcion.Text = articulo.Descripcion;
						lblPrecio.Text = articulo.Precio.ToString();
						imgProducto.ImageUrl = articulo.ImagenUrl;
					}					
                }
			}
			catch (Exception ex)
			{
				throw ex;
			}
        }
    }
}