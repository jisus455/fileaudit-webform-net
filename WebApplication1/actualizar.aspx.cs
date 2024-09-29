using Newtonsoft.Json;
using RenderGridAspxDll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp2.api.Services;
using tp2.modals;

namespace WebApplication1
{
    
    public partial class actualizar : System.Web.UI.Page
    {

        UsuariosService servicio = new UsuariosService();
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

        public void completarCampos()
        {
            string json = servicio.GetUsersById(id);
            var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);

            if (data.Count > 0)
            {
                var items = data[0];
                txtId.Text = items.Id.ToString();
                txtNombre.Text = items.Nombre.ToString();
                txtApellido.Text = items.Apellido.ToString();
                cmbRol.Text = items.Rol.ToString();
                cmbArea.Text = items.Area.ToString();
                txtUsuario.Text = items.Usuario.ToString();
                txtContraseña.Text = items.Contraseña.ToString();
                txtEmail.Text = items.Email.ToString();
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuarios usuario = new Usuarios();
            usuario.Id = Convert.ToInt32(txtId.Text);
            usuario.Nombre = txtNombre.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Rol = cmbRol.Text;
            usuario.Area = cmbArea.Text;
            usuario.Usuario = txtUsuario.Text;
            usuario.Contraseña = txtContraseña.Text;
            usuario.Email = txtEmail.Text;

            bool respuesta = servicio.UpdateUser(usuario);

            if (respuesta)
            {
                Response.Redirect("index.aspx");
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}