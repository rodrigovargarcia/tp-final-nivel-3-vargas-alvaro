using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using Dominio;
using System.Diagnostics.Eventing.Reader;

namespace CatalogoWebMaxP
{
    public partial class FormularioProductos : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ConfirmaEliminacion = false;
                    txtId.Enabled = false;
                    MarcasNegocio negocio = new MarcasNegocio();
                    List<Marcas> listaMar = negocio.listar();
                    ddlMarca.DataSource = listaMar;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    CategoriaNegocio negocio2 = new CategoriaNegocio();
                    List<Categoria> listaCat = negocio2.listar();
                    ddlCategoria.DataSource = listaCat;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();

                }
                //if (Request.QueryString["id1"] !=null)
                //{

                //}
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Articulos seleccionado = (negocio.listar(id))[0];
                    lblNombreProd.Text = seleccionado.Nombre;
                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtDescripcion.Text = seleccionado.Descripcion;
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = seleccionado.Categorias.Id.ToString();
                    txtImagen.Text = seleccionado.ImagenUrl.ToString();
                    txtImagen_TextChanged(sender, e);
                }
                else
                {
                    btnEliminar.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                    return;
                Articulos nuevo = new Articulos();
                ArticulosNegocio negocio = new ArticulosNegocio();                
                nuevo.Nombre = txtNombre.Text;
                nuevo.Codigo = txtCodigo.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);
                nuevo.ImagenUrl = txtImagen.Text;
                nuevo.Descripcion = txtDescripcion.Text;

                nuevo.Marca = new Marcas();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.Categorias = new Categoria();
                nuevo.Categorias.Id = int.Parse(ddlCategoria.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificar(nuevo);
                }
                else
                    negocio.agregar(nuevo);
                if (Session["lista"] != null)
                {
                    Session.Clear();
                    Response.Redirect("ListadoProductos.aspx", false);
                }
                else
                {
                    Response.Redirect("ListadoProductos.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            imgProducto.ImageUrl = txtImagen.Text;
        }

        protected void btnConfirmaEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                int id = int.Parse(txtId.Text);
                negocio.eliminar(id);
                Response.Redirect("ListadoProductos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());                
                Response.Redirect("/Error.aspx");
            }
        }
    }
}