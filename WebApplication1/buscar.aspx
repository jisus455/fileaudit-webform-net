<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buscar.aspx.cs" Inherits="WebApplication1.buscar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Buscar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">

        <%-- Navbar --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand ps-2" href="index.aspx">FileAudit</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="pe-2" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <div class="btn-group">
                                <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                    Jesus Espinoza
                                </button>

                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start dropdown-menu-dark">
                                    <li><a class="dropdown-item" href="index.aspx">Mi perfil</a></li>
                                    <li><a class="dropdown-item" href="index.aspx">Cambiar clave</a></li>
                                    <li><a class="dropdown-item" href="login.aspx">Cerrar sección</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%--Card--%>
        <div class="card customCard bg-body-secondary">
            <div class="card-body">
                <div class="pt-2"></div>
                <h3 class="card-title">Buscar un registro</h3>
                <div class="pt-2"></div>
            </div>
        </div>

       <%--Buscar--%>
        <div class="container-fluid pt-3 pb-3 row">
            <div class="col">
                <form>
                    <div class="row">
                        <div class="col">
                            <asp:DropDownList ID="cmbBuscar" runat="server" class="form-select">
                                <asp:ListItem>Nombre</asp:ListItem>
                                <asp:ListItem>Apellido</asp:ListItem>
                                <asp:ListItem>Usuario</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:TextBox ID="txtBuscar" runat="server" class="form-control" type="search" placeholder="Buscar"></asp:TextBox>
                        </div>
                        <div class="col">
                            <asp:Button ID="btnBuscar" runat="server" class="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" />
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-2 pe-0">
                <asp:Button ID="btnMostarTodo" runat="server" class="btn btn-secondary" Text="Mostrar todo" OnClick="btnMostarTodo_Click" />
                <asp:Button ID="btnVolver" runat="server" class="btn btn-secondary" Text="Volver" OnClick="btnVolver_Click" />
            </div>
        </div>

        <hr />
        <hr />

        <!-- Tabla -->
        <table class="table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Rol</th>
                    <th>Area</th>
                    <th>Usuario</th>
                    <th>Contraseña</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody id="grdDatos" runat="server"></tbody>
        </table>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>
