﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="actualizar.aspx.cs" Inherits="WebApplication1.actualizar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Actualizar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">


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
                <h3 class="card-title">Actualizar un registro</h3>
                <div class="pt-2"></div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="modalActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <h5 class="modal-title" id="staticBackdropLabel">Actualizar registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <form class="row g-3">
                            <div class="row p-3 pb-2">
                                <div class="col">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtId" runat="server" class="form-control" type="text" Visible="false"></asp:TextBox>
                                    </div>
                                    <label class="form-label">Nombre</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtNombre" runat="server" class="form-control" type="text" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-label">Apellido</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtApellido" runat="server" class="form-control" type="text" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-3 pb-2">
                                <div class="col">
                                    <label class="form-label">Rol</label>

                                    <div class="input-group">
                                        <asp:DropDownList ID="cmbRol" runat="server" class="form-select" required="true">
                                            <asp:ListItem>INVITADO</asp:ListItem>
                                            <asp:ListItem>SUPERVISOR</asp:ListItem>
                                            <asp:ListItem>ADMINISTRADOR</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col">
                                    <label class="form-label">Area</label>

                                    <div class="input-group">
                                        <asp:DropDownList ID="cmbArea" runat="server" class="form-select">
                                            <asp:ListItem>Departamento IT</asp:ListItem>
                                            <asp:ListItem>Administracion</asp:ListItem>
                                            <asp:ListItem>Finanzas</asp:ListItem>
                                            <asp:ListItem>Seguridad</asp:ListItem>
                                            <asp:ListItem>Legales</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                            </div>

                            <div class="row p-3 pb-2">

                                <div class="col">
                                    <label class="form-label">Usuario</label>

                                    <div class="input-group">
                                        <asp:TextBox ID="txtUsuario" runat="server" class="form-control" type="text" required="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col">
                                    <label class="form-label">Contraseña</label>

                                    <div class="input-group">
                                        <asp:TextBox ID="txtContraseña" runat="server" class="form-control" type="password" required="true"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div class="row p-3 pb-2">

                                <div class="col">
                                    <label class="form-label">Email</label>

                                    <div class="input-group">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" type="email" required="true"></asp:TextBox>
                                    </div>
                                </div>

                            </div>


                            <div class="row p-3 pb-3">
                                <div class="col">
                                    <div class="form-check">
                                        <input runat="server" class="form-check-input" type="checkbox" id="ckbCheck" required>

                                        <label class="form-check-label">
                                            Aceptar los Terminos y Condiciones
                                        </label>
                                    </div>
                                </div>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-primary" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
        </div>


        <div class="row ps-3 p-2">

            <div class="col-3">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalActualizar">Editar</button>
                <asp:LinkButton ID="btnVolver" runat="server" class="btn btn-secondary" OnClick="btnVolver_Click">Volver</asp:LinkButton>
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
