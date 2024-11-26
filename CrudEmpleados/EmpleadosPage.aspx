<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadosPage.aspx.cs" Inherits="CrudEmpleados.EmpleadosPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Gestion de Empleados</h2>
    <div class="container">

        <div class="row">

            <div class="col-md-12 mb-3">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCrearEmpleado">
                    <i class="bi bi-plus"></i>Agregar Empleado
                </button>
            </div>

            <div class="col-md-12">
                <asp:GridView ID="GridViewEmpleados" runat="server" AutoGenerateColumns="false" CssClass="grid-view" OnRowCommand="GridViewEmpleados_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo Electrónico" />
                        <asp:BoundField DataField="Salario" HeaderText="Salario" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn btn-primary">
            <i class="bi bi-pencil"></i> Editar
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn btn-danger"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este empleado?');">
            <i class="bi bi-trash"></i> Eliminar
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-warning" role="alert">
                            No existen empleados en la base de datos.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>

    <div class="form-inline">
        <label for="txtBuscarNombre" class="mr-2">Buscar por Nombre:</label>
        <asp:TextBox ID="txtBuscarNombre" runat="server" CssClass="form-control mr-2" placeholder="Ingrese nombre"></asp:TextBox>
        <asp:LinkButton ID="btnBuscar" runat="server" CssClass="btn btn-info mr-2" OnClick="btnBuscar_Click">
        <span class="bi bi-search"></span> Buscar
        </asp:LinkButton>
        <asp:LinkButton ID="btnMostrarTodos" runat="server" CssClass="btn btn-secondary" OnClick="btnMostrarTodos_Click">
        <span class="bi bi-eye"></span> Mostrar Todos
        </asp:LinkButton>
    </div>


    <div class="modal fade" id="modalCrearEmpleado" tabindex="-1" role="dialog" aria-labelledby="modalCrearLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCrearLabel">Crear Empleado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtNombreCrear">Nombre:</label>
                        <asp:TextBox ID="txtNombreCrear" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="nombreError" class="text-danger" style="display: none;">El nombre solo debe contener letras.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoCrear">Apellido:</label>
                        <asp:TextBox ID="txtApellidoCrear" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="apellidoError" class="text-danger" style="display: none;">El apellido solo debe contener letras.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtCorreoCrear">Correo Electrónico:</label>
                        <asp:TextBox ID="txtCorreoCrear" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="correoError" class="text-danger" style="display: none;">Por favor ingrese un correo electrónico válido.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtSalarioCrear">Salario:</label>
                        <asp:TextBox ID="txtSalarioCrear" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="salarioError" class="text-danger" style="display: none;">El salario debe ser un número entero positivo.</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarCrear" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClientClick="return validarFormularioCrear();" OnClick="btnGuardarCrear_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        function validarFormularioCrear() {
            var nombre = document.getElementById('<%= txtNombreCrear.ClientID %>').value;
        var apellido = document.getElementById('<%= txtApellidoCrear.ClientID %>').value;
        var correo = document.getElementById('<%= txtCorreoCrear.ClientID %>').value;
        var salario = document.getElementById('<%= txtSalarioCrear.ClientID %>').value;

            var isValid = true;

            var nombreRegex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$/;
            if (!nombreRegex.test(nombre)) {
                document.getElementById('nombreError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('nombreError').style.display = 'none';
            }

            var apellidoRegex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$/;
            if (!apellidoRegex.test(apellido)) {
                document.getElementById('apellidoError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('apellidoError').style.display = 'none';
            }

            var correoRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!correoRegex.test(correo)) {
                document.getElementById('correoError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('correoError').style.display = 'none';
            }

            var salarioRegex = /^[0-9]+$/;
            if (!salarioRegex.test(salario)) {
                document.getElementById('salarioError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('salarioError').style.display = 'none';
            }

            return isValid;
        }
    </script>


    <div class="modal fade" id="modalEditarEmpleado" tabindex="-1" role="dialog" aria-labelledby="modalEditarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditarLabel">Editar Empleado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfEmpleadoId" runat="server" />
                    <div class="form-group">
                        <label for="txtNombreEditar">Nombre:</label>
                        <asp:TextBox ID="txtNombreEditar" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="nombreEditarError" class="text-danger" style="display: none;">El nombre solo debe contener letras.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidoEditar">Apellido:</label>
                        <asp:TextBox ID="txtApellidoEditar" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="apellidoEditarError" class="text-danger" style="display: none;">El apellido solo debe contener letras.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtCorreoEditar">Correo Electrónico:</label>
                        <asp:TextBox ID="txtCorreoEditar" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="correoEditarError" class="text-danger" style="display: none;">Por favor ingrese un correo electrónico válido.</span>
                    </div>
                    <div class="form-group">
                        <label for="txtSalarioEditar">Salario:</label>
                        <asp:TextBox ID="txtSalarioEditar" CssClass="form-control" runat="server"></asp:TextBox>
                        <span id="salarioEditarError" class="text-danger" style="display: none;">El salario debe ser un número entero positivo.</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnGuardarEditar" runat="server" CssClass="btn btn-primary" Text="Guardar Cambios" OnClientClick="return validarFormularioEditar();" OnClick="btnGuardarEditar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        function validarFormularioEditar() {
            var nombre = document.getElementById('<%= txtNombreEditar.ClientID %>').value;
        var apellido = document.getElementById('<%= txtApellidoEditar.ClientID %>').value;
        var correo = document.getElementById('<%= txtCorreoEditar.ClientID %>').value;
        var salario = document.getElementById('<%= txtSalarioEditar.ClientID %>').value;

            var isValid = true;

            var nombreRegex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$/;
            if (!nombreRegex.test(nombre)) {
                document.getElementById('nombreEditarError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('nombreEditarError').style.display = 'none';
            }

            var apellidoRegex = /^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$/;
            if (!apellidoRegex.test(apellido)) {
                document.getElementById('apellidoEditarError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('apellidoEditarError').style.display = 'none';
            }

            var correoRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!correoRegex.test(correo)) {
                document.getElementById('correoEditarError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('correoEditarError').style.display = 'none';
            }

            var salarioRegex = /^[0-9]+$/;
            if (!salarioRegex.test(salario)) {
                document.getElementById('salarioEditarError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('salarioEditarError').style.display = 'none';
            }

            return isValid;
        }
    </script>


    <style>
        h2 {
            margin-top: 2rem !important;
            margin-bottom: 30px !important;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }

            .grid-view th,
            .grid-view td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .grid-view th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

        .form-inline {
            margin-top: 20px;
        }
    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>

