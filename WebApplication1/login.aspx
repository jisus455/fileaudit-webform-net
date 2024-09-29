<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

        <form id="form1" runat="server" class="d-flex vh-100 justify-content-center align-items-center" style="background: linear-gradient(45deg, aqua, lightblue, blue);">


            <div class="col-4 bg-light p-5 border border-info border-3 rounded-3">

                <img width="350px" src="https://s3.amazonaws.com/heysummit-production/media/thumbnails/uploads/events/frenchmsp-summit/C8yqEvihx5wnFHm3CLsUhf_logo_large.PNG" />
                <hr />

                <%--Alerta--%>
                <div runat="server" id="alertaLogin" class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Atencion!</strong> Los datos ingresados son incorrectos, vuelva a intentarlo
                <asp:Button ID="btnAlerta" runat="server" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" OnClick="btnAlerta_Click" />
                </div>

                <div runat="server" id="panelUser" class="pt-2">

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

                </div>


                <div runat="server" id="panelPassword">

                    <div class="row">
                        <asp:Label ID="lblContraseña" runat="server" Text="Ingrese Contraseña" class="form-label"></asp:Label>
                    </div>

                    <div class="row">
                        <asp:TextBox class="form-control" type="password" ID="txtContraseña" runat="server"></asp:TextBox>
                    </div>

                    <hr />
                    <div class="row">
                        <asp:Button class="btn btn-primary" ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
                    </div>
                </div>

                <div class="row pt-3">
                    <asp:Button class="btn btn-secondary" ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
                </div>

                <div class="row pt-3">
                    <asp:Button class="btn btn-secondary" ID="btnClave" runat="server" Text="Olvide mi clave" OnClick="btnClave_Click" />
                </div>

            </div>

        </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>
