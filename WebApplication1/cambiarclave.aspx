<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cambiarclave.aspx.cs" Inherits="WebApplication1.cambiarclave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cambiar clave</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server" class="row align-items-center justify-content-center vh-100" style="background: linear-gradient(45deg, purple, lightblue, blue);">

        <div class="col-4 bg-light p-5 h-75 border border-info border-3" style="border-radius: 20px;">

            <div runat="server" id="alertaLogin" class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Atencion!</strong> Los datos ingresados son incorrectos, vuelva a intentarlo
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <asp:Label class="h2" ID="lblClave" runat="server" Text="Cambiar clave"></asp:Label>
            <hr />

            <div runat="server" id="panelUsuario">

                <form>
                    <div class="row">
                        <asp:Label ID="lblUsuario" runat="server" Text="Ingrese usuario" class="form-label"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" ID="txtUsuario" runat="server" required="true"></asp:TextBox>
                    </div>

                    <hr />
                    <div class="row">
                        <asp:Button class="btn btn-primary" ID="btnSiguiente" runat="server" Text="Siguiente" OnClick="btnSiguiente_Click" />
                    </div>
                </form>

            </div>


            <div runat="server" id="panelCodigo">

                <form>
                    <div class="row">
                        <asp:Label ID="lblCodigoM" runat="server" Text="Codigo" class="form-label"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" ID="txtCodigoM" runat="server" Enabled="false"></asp:TextBox>
                    </div>

                    <div class="row">
                        <asp:Label ID="lblCodigo" runat="server" Text="Ingrese codigo" class="form-label"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" ID="txtCodigo" runat="server" required="true"></asp:TextBox>
                    </div>

                    <hr />
                    <div class="row">
                        <asp:Button class="btn btn-primary" ID="btnVerificar" runat="server" Text="Verificar" OnClick="btnVerificar_Click" />
                    </div>
                </form>

            </div>

            <div runat="server" id="panelClave">

                <form>
                    <div class="row">
                        <asp:Label ID="lblContraseña" runat="server" Text="Ingrese la nueva contraseña" class="form-label"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" ID="txtContraseña" runat="server" type="password" required="true"></asp:TextBox>
                    </div>

                    <div class="row">
                        <asp:Label ID="lblContraseña2" runat="server" Text="Repetir contraseña" class="form-label" ></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" ID="txtContraseña2" runat="server" type="password" required="true"></asp:TextBox>
                    </div>

                    <hr />
                    <div class="row">
                        <asp:Button class="btn btn-primary" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
                    </div>
                </form>

            </div>

            <div class="row pt-3">
                <asp:Button class="btn btn-secondary" ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
            </div>

             <div class="row pt-3">
                <asp:Button class="btn btn-secondary" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>

        </div>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
