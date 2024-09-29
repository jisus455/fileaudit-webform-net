using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using tp2.api.Services;
using tp2.modals;

namespace UnitTest
{
    [TestClass]
    public class UnitTest1
    {

        UsuariosService service = new UsuariosService();
        [TestMethod]
        public void TestMethod1()
        {
            bool resultado = service.GetUsers() != "";
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod2()
        {
            Usuarios user = new Usuarios();
            user.Id = 2;
            bool resultado = service.GetUsersById(Convert.ToString(user.Id)) != "";
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod3()
        {
            Usuarios user = new Usuarios();
            user.Usuario = "Juancho";
            bool resultado = service.GetDatosByUser(user.Usuario) != "";
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod4()
        {
            string tipo = "Nombre";
            string buscar = "Pedro";
            bool resultado = service.GetBuscar(tipo, buscar) != "";
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod5()
        {
            Usuarios user = new Usuarios();
            user.Nombre = "Juan";
            user.Apellido = "Perez";
            user.Rol = "ADMINISTRADOR";
            user.Area = "Administracion";
            user.Usuario = "juan222";
            user.Contraseña = "Perez312";
            user.Email = "juanpe@gmail.com";
            bool resultado = service.PostUser(user);
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod6()
        {
            Usuarios user = new Usuarios();
            user.Nombre = "Juan";
            user.Apellido = "Perez";
            user.Rol = "ADMINISTRADOR";
            user.Area = "Finanzas";
            user.Usuario = "juan222";
            user.Contraseña = "Perez312";
            user.Email = "juanpe@gmail.com";
            bool resultado = service.UpdateUser(user);
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod7()
        {
            Usuarios user = new Usuarios();
            user.Usuario = "juan222";
            user.Contraseña = "Perez315";
            bool resultado = service.UpdateContraseña(user.Usuario, user.Contraseña);
            Assert.IsTrue(resultado);
        }
        [TestMethod]
        public void TestMethod8()
        {
            Usuarios user = new Usuarios();
            user.Id = 1;
            bool resultado = service.DeleteUser(Convert.ToString(user.Id));
            Assert.IsTrue(resultado);
        }


    }
}
