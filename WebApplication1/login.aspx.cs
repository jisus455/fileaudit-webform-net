using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp2.api.Services;
using System.Threading.Tasks;
using Newtonsoft.Json;
using tp2.modals;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {

        UsuariosService service = new UsuariosService();

        protected void Page_Load(object sender, EventArgs e)
        {
            alertaLogin.Visible = false;
            getPanelUser();
        }

        protected void getPanelUser()
        {
            panelUser.Visible = true;
            panelPassword.Visible = false;
            btnClave.Visible = false;
            btnVolver.Visible = false;
        }

        protected void getPanelPassword()
        {
            panelUser.Visible = false;
            panelPassword.Visible = true;
            btnClave.Visible = true;
            btnVolver.Visible = true;
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            // capturamos el usuario y hacemos una query para saberr si existe ese usuario
            string usuario = txtUsuario.Text;
            string json = service.GetDatosByUser(usuario);
            var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);

            if (data.Count == 0)
            {
                alertaLogin.Visible = true;
                btnVolver.Visible = true;
            }
            else
            {
                getPanelPassword();
            }

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtContraseña.Text == "")
            {
                return;
            }

            // guardamos los datos ingresados en variables
            string usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;

            // capturamos el usuario y hago una query para traer la contraseña y el id segun el usuario
            string json = service.GetDatosByUser(usuario);
            var data = JsonConvert.DeserializeObject<List<Usuarios>>(json);
            
            var items = data[0];
            string id = items.Id.ToString();
            string contraseña1 = items.Contraseña.ToString();

            // si la contraseña es correcta ingresa a la otra pagina sino no ingresa
            if (contraseña.Equals(contraseña1))
            {
                Response.Redirect("index.aspx?id=" + id);
            }
            else
            {
                txtUsuario.Text = "";
                txtContraseña.Text = "";
                panelUser.Visible = false;
                panelPassword.Visible = false;
                alertaLogin.Visible = true;
                btnVolver.Visible = true;
            }
        }

        protected void btnAlerta_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void btnClave_Click(object sender, EventArgs e)
        {
            Response.Redirect("cambiarclave.aspx");
        }
    }
}
