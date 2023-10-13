using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using negocio;

namespace CatalogoWebMaxP
{
    public partial class ListadoProductos : System.Web.UI.Page
    { 
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Seguridad.esAdmin(Session["usuario"]))
                {
                    FiltroAvanzado = false;
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Session.Add("listaDeArticulos", negocio.listar());
                    dgvProductos.DataSource = Session["listaDeArticulos"];
                    dgvProductos.DataBind();
                }
                else
                {
                    Session.Add("error", "Debes tener perfil de admin para poder ingresar");
                    Response.Redirect("/Error.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (Session["lista"] != null)
                {
                    dgvProductos.DataSource = Session["lista"];
                    dgvProductos.DataBind();
                    string id1 = dgvProductos.SelectedDataKey.Value.ToString();
                    Response.Redirect("FormularioProductos.aspx?id=" + id1);
                }
                string id = dgvProductos.SelectedDataKey.Value.ToString();
                Response.Redirect("FormularioProductos.aspx?id=" + id);            
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void dgvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProductos.PageIndex = e.NewPageIndex;
            dgvProductos.DataBind();
        }

        protected void dgvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    decimal precio = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Precio"));
                    e.Row.Cells[3].Text = precio.ToString("N1");
                }            
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulos> lista = (List<Articulos>)Session["listaDeArticulos"];
            List<Articulos> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvProductos.DataSource = listaFiltrada;
            dgvProductos.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkFiltroAvanzado.Checked;

        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCriterio.Items.Clear();            
                if(ddlCampo.SelectedItem.ToString() == "Precio")
                {
                    ddlCriterio.Items.Add("Mayor a");
                    ddlCriterio.Items.Add("Igual a");
                    ddlCriterio.Items.Add("Menor a");
                }
                else
                {
                    ddlCriterio.Items.Add("Comienza con");
                    ddlCriterio.Items.Add("Contiene");
                    ddlCriterio.Items.Add("Termina con");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                List<Articulos> listaFiltrada = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.Text, txtFiltroAvanzado.Text);
                dgvProductos.DataSource = listaFiltrada;
                Session.Add("lista", listaFiltrada);
                dgvProductos.DataBind();
                                
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }
    }
}