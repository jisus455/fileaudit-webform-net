<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eliminar.aspx.cs" Inherits="WebApplication1.eliminar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Eliminar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">

        <%--Navbar--%>
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
                                    <li><a class="dropdown-item" href="login.aspx">Cerrar seccion</a></li>
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
                <h3 class="card-title">Eliminar un registro</h3>
                <div class="pt-2"></div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <h5 class="modal-title" id="staticBackdropLabel">Eliminar registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col">
                                <asp:Image ID="Image1" runat="server" Width="220" ImageUrl="data:image/jpeg;base64,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" />
                            </div>

                            <div class="col pe-4">
                                <div class="row">
                                    <asp:Label ID="lblNombre" runat="server" Text="Nombre" class="h2"></asp:Label>
                                </div>

                                <div class="row">
                                    <asp:Label ID="lblApellido" runat="server" Text="Apellido" class="h2"></asp:Label>
                                </div>

                                <div class="row pt-5">
                                    <asp:Label ID="lblRol" runat="server" Text="Rol" class="h4"></asp:Label>
                                </div>

                                <div class="row">
                                    <asp:Label ID="lblArea" runat="server" Text="Area" class="h5"></asp:Label>
                                </div>

                            </div>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-secondary" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" data-bs-dismiss="modal" />
                        <asp:Button class="btn btn-danger" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <%--botones--%>
        <div class="row ps-3 p-2">
            <div class="col-2">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button>
                <asp:LinkButton runat="server" ID="btnVolver" class="btn btn-secondary" OnClick="btnVolver_Click">Volver</asp:LinkButton>
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
