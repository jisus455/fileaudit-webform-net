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
    public partial class index : System.Web.UI.Page
    {

        UsuariosService service = new UsuariosService();
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["id"];
                if (id != null)
                {
                    btnPerfil.HRef = "actualizar.aspx?id=" + id;
                    btnClave.HRef = "cambiarclave.aspx?id=" + id;
                }

                alertaError.Visible = false;
                GetUsers();
            }
        }

        public void GetUsers()
        {
            string jsonResponse = service.GetUsers();
            List<string> columnas = new List<string>();
            columnas.Add("Id");
            columnas.Add("Nombre");
            columnas.Add("Apellido");
            columnas.Add("Rol");
            columnas.Add("Area");
            columnas.Add("Usuario");
            columnas.Add("Contraseña");
            columnas.Add("Email");
            this.grdDatos.InnerHtml = RenderGrid.Render(jsonResponse, columnas, true);
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("buscar.aspx");
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuarios usuario = new Usuarios();
            usuario.Nombre = txtNombre1.Text;
            usuario.Apellido = txtApellido.Text;
            usuario.Rol = cmbRol.Text;
            usuario.Area = cmbArea.Text;
            usuario.Usuario = txtUsuario.Text;
            usuario.Contraseña = txtContraseña.Text;
            usuario.Email = txtEmail.Text;

            bool resultado = service.PostUser(usuario);

            if (resultado)
            {
                GetUsers();
                alertaError.Visible = true;
                alertaError.Attributes.Add("class", "alert alert-success");
                alertaError.InnerText = "Usuario creado correctamente";
                vaciarCampos();

            }
            else
            {
                // muestra un error
                alertaError.Visible = true;
                alertaError.Attributes.Add("class", "alert alert-danger");
                alertaError.InnerText = "Es obligatorio completar todos los datos";
            }
        }

        public void vaciarCampos()
        {
            txtNombre1.Text = "";
            txtApellido.Text = "";
            cmbRol.Text = "";
            cmbArea.Text = "";
            txtUsuario.Text = "";
            txtContraseña.Text = "";
            txtEmail.Text = "";
            ckbCheck.Checked = false;
        }


    }
}