using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tp2.api.Handlers;
using tp2.modals;

namespace tp2.api.Services
{
    public class UsuariosService
    {

        public string GetUsers()
        {
            return MySQLHandlers.GetJson("select * from usuarios");
        }

        public string GetUsersById(string id)
        {
            return MySQLHandlers.GetJson("select * from usuarios where Id = " + id);
        }

        public string GetDatosByUser(string usuario)
        {
            return MySQLHandlers.GetJson($"select * from usuarios where Usuario = '{usuario}'");
        }

        public string GetBuscar(string tipo, string buscar)
        {
            return MySQLHandlers.GetJson($"select * from usuarios where {tipo} = '{buscar}'");
        }

        public bool PostUser(Usuarios user)
        {
            if (user.Nombre == "" || user.Apellido == "" || user.Rol == "" || user.Area == "" || user.Usuario == "" || user.Contraseña == "" || user.Email == "")
            {
                return false;
            }
            else
            {
                return MySQLHandlers.Exec($"INSERT INTO Usuarios VALUES ('0','{user.Nombre}','{user.Apellido}','{user.Rol}','{user.Area}','{user.Usuario}','{user.Contraseña}','{user.Email}')");
            }

        }

        public bool UpdateUser(Usuarios user)
        {
            if (user.Nombre == "" || user.Apellido == "" || user.Rol == "" || user.Area == "" || user.Usuario == "" || user.Contraseña == "" || user.Email == "")
            {
                return false;
            }
            else
            {
                return MySQLHandlers.Exec($"UPDATE Usuarios set Nombre = '{user.Nombre}', Apellido = '{user.Apellido}', Rol = '{user.Rol}', Area = '{user.Area}', Usuario = '{user.Usuario}', Contraseña = '{user.Contraseña}', Email = '{user.Email}' where Id = " + user.Id);

            }

        }

        public bool UpdateContraseña(string usuario, string contraseña)
        {
            if (usuario == "" || contraseña == "")
            {
                return false;
            }
            else
            {
                return MySQLHandlers.Exec($"UPDATE Usuarios set Contraseña = '{contraseña}' where Usuario = '{usuario}'");

            }

        }

        public bool DeleteUser(string id)
        {
           return MySQLHandlers.Exec($"DELETE FROM Usuarios WHERE Id = {id}");
        }


    }
}
