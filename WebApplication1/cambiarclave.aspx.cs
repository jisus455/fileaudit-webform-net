using Newtonsoft.Json;
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
    public partial class cambiarclave : System.Web.UI.Page
    {
        UsuariosService servicio = new UsuariosService();
        public string id;
        public string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            alertaLogin.Visible = false;
            btnLogin.Visible = false;
            btnVolver.Visible = false;
            
            if (id == null)
            {
                // cambiar contraseña sin saber id, es decir viene desde el login
                getPanelUsuario();
            }
            else
            {
                // cambiar contraseña saber id, viene de index
                getPanelClave();
            }
        }

        protected void getPanelUsuario()
        {
            panelUsuario.Visible = true;
            panelCodigo.Visible = false;
            panelClave.Visible = false;
        }

        protected void getPanelCodigo()
        {
            panelUsuario.Visible = false;
            panelCodigo.Visible = true;
            panelClave.Visible = false;
        }

        protected void getPanelClave()
        {
            panelUsuario.Visible = false;
            panelCodigo.Visible = false;
            panelClave.Visible = true;
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            // verificamos que el usuario exista
            string usuario = txtUsuario.Text;
            string json = servicio.GetDatosByUser(usuario);
            var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);

            if (data.Count > 0)
            {
                Random rnd = new Random();
                int codigo = rnd.Next(1111, 9999 + 1);
                txtCodigoM.Text = Convert.ToString(codigo);
                getPanelCodigo();
            }
            else
            {
                alertaLogin.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                alertaLogin.Visible = true;
                return;
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            string codigo1 = txtCodigo.Text;
            string codigo2 = txtCodigoM.Text;

            // si los codigos son iguales vamos a la clave
            if (codigo1.Equals(codigo2))
            {
                getPanelClave();
            }
            else
            {
                getPanelCodigo();
                alertaLogin.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                alertaLogin.InnerText = "Los codigos no coinciden, vuelva a intentarlo";
                alertaLogin.Visible = true;
            }

        }


        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            string contraseña1 = txtContraseña.Text;
            string contraseña2 = txtContraseña2.Text;

            // verificamos que las contraseñas sean iguales
            if (contraseña1.Equals(contraseña2))
            {
                // si no tiene id guarda el usuario sino hacemos una query para obtenrlo segun el id
                if (id == null)
                {
                    usuario = txtUsuario.Text;
                }
                else
                {
                    string json = servicio.GetUsersById(id);
                    var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);
                    if (data.Count > 0)
                    {
                        var items = data[0];
                        usuario = items.Usuario.ToString();
                    }
                }

                bool resultado = servicio.UpdateContraseña(usuario, contraseña1);
                if (resultado)
                {
                    alertaLogin.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
                    alertaLogin.InnerText = "Contraseña actualizada correctamente";
                    getPanelClave();
                    alertaLogin.Visible = true;
                    btnVolver.Visible = false;
                    btnLogin.Visible = true;
                }

            }
            else
            {
                alertaLogin.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                alertaLogin.InnerText = "Las contraseñas no coinciden";
                alertaLogin.Visible = true;
                getPanelClave();

            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("cambiarclave.aspx");
        }
        protected void btnAlerta_Click(object sender, EventArgs e)
        {
            Response.Redirect("cambiarclave.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}