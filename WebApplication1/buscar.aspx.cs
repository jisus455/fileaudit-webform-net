using RenderGridAspxDll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp2.api.Services;

namespace WebApplication1
{
    public partial class buscar : System.Web.UI.Page
    {

        UsuariosService service = new UsuariosService();
        public List<string> columnas = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            columnas.Add("Id");
            columnas.Add("Nombre");
            columnas.Add("Apellido");
            columnas.Add("Rol");
            columnas.Add("Area");
            columnas.Add("Usuario");
            columnas.Add("Contraseña");
            columnas.Add("Email");
            GetUsers();
        }

        public void GetUsers()
        {
            string jsonResponse = service.GetUsers();
            this.grdDatos.InnerHtml = RenderGrid.Render(jsonResponse, columnas, true);
        }

        public void Buscar(string tipo, string buscar)
        {
            string json = service.GetBuscar(tipo, buscar);
            this.grdDatos.InnerHtml = RenderGrid.Render(json, columnas, true);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text == "")
            {
                return;
            }

            string buscar = txtBuscar.Text;
            string tipo = cmbBuscar.Text;
            Buscar(tipo, buscar);
        }

        protected void btnMostarTodo_Click(object sender, EventArgs e)
        {
            GetUsers();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}