using Newtonsoft.Json;
using RenderGridAspxDll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp2.api.Handlers;
using tp2.api.Services;
using tp2.modals;

namespace WebApplication1
{
    public partial class eliminar : System.Web.UI.Page
    {
        UsuariosService servicio = new UsuariosService();
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            // capturamos el id de la url
            id = Request.QueryString["id"];
            // si no tiene id vuelve a login
            if (id == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                completarCampos();
                GetUsers();
            }
        }

        public void GetUsers()
        {
            string jsonResponse = servicio.GetUsersById(id);
            List<string> columnas = new List<string>();
            columnas.Add("Id");
            columnas.Add("Nombre");
            columnas.Add("Apellido");
            columnas.Add("Rol");
            columnas.Add("Area");
            columnas.Add("Usuario");
            columnas.Add("Contraseña");
            columnas.Add("Email");
            this.grdDatos.InnerHtml = RenderGrid.Render(jsonResponse, columnas, false);
        }

        public void completarCampos()
        {
            string json = servicio.GetUsersById(id);
            var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);

            if (data.Count > 0)
            {
                var items = data[0];
                lblNombre.Text = items.Nombre.ToString();
                lblApellido.Text = items.Apellido.ToString();
                lblRol.Text = items.Rol.ToString();
                lblArea.Text = items.Area.ToString();
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            bool resultado = servicio.DeleteUser(id);
            if (resultado)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}