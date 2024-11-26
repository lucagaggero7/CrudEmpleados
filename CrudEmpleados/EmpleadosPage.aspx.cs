using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudEmpleados
{
    public partial class EmpleadosPage : System.Web.UI.Page
    {
        private DatosEmpleado datosEmpleado = new DatosEmpleado();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Mostrar();
            }
        }

        private void Mostrar()
        {
            List<Empleado> empleados = datosEmpleado.ObtenerEmpleados();
            GridViewEmpleados.DataSource = empleados;
            GridViewEmpleados.DataBind();
        }

        protected void btnGuardarCrear_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreCrear.Text;
            string apellido = txtApellidoCrear.Text;
            string correo = txtCorreoCrear.Text;
            string salarioStr = txtSalarioCrear.Text;

            if (!System.Text.RegularExpressions.Regex.IsMatch(nombre, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$"))
            {
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(apellido, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$"))
            {
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(correo, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                return;
            }

            if (!int.TryParse(salarioStr, out int salario) || salario <= 0)
            {
                return;
            }

            Empleado nuevoEmpleado = new Empleado
            {
                Nombre = nombre,
                Apellido = apellido,
                CorreoElectronico = correo,
                Salario = salario
            };

            datosEmpleado.CrearEmpleado(nuevoEmpleado);
            Mostrar();
        }

        protected void btnGuardarEditar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreEditar.Text;
            string apellido = txtApellidoEditar.Text;
            string correo = txtCorreoEditar.Text;
            string salarioStr = txtSalarioEditar.Text;

            if (!System.Text.RegularExpressions.Regex.IsMatch(nombre, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$"))
            {
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(apellido, @"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]+$"))
            {
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(correo, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                return;
            }

            if (!int.TryParse(salarioStr, out int salario) || salario <= 0)
            {
                return;
            }

            int empleadoId = Convert.ToInt32(hfEmpleadoId.Value);

            Empleado empleado = new Empleado
            {
                Id = empleadoId,
                Nombre = nombre,
                Apellido = apellido,
                CorreoElectronico = correo,
                Salario = salario
            };

            datosEmpleado.ModificarEmpleado(empleado);
            Mostrar();

            ScriptManager.RegisterStartupScript(this, GetType(), "CerrarModalEditar", "$('#modalEditarEmpleado').modal('hide');", true);
        }


        protected void GridViewEmpleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int empleadoId = Convert.ToInt32(e.CommandArgument);

                Empleado empleado = datosEmpleado.ObtenerEmpleadoPorId(empleadoId);
                if (empleado != null)
                {
                    hfEmpleadoId.Value = empleado.Id.ToString();
                    txtNombreEditar.Text = empleado.Nombre;
                    txtApellidoEditar.Text = empleado.Apellido;
                    txtCorreoEditar.Text = empleado.CorreoElectronico;
                    txtSalarioEditar.Text = empleado.Salario.ToString();

                    ScriptManager.RegisterStartupScript(this, GetType(), "AbrirModalEditar", "$('#modalEditarEmpleado').modal('show');", true);
                }
            }
            else if (e.CommandName == "Eliminar")
            {
                int empleadoId = Convert.ToInt32(e.CommandArgument);
                datosEmpleado.BorrarEmpleado(empleadoId);
                Mostrar();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombreBusqueda = txtBuscarNombre.Text.Trim();
            if (!string.IsNullOrEmpty(nombreBusqueda))
            {
                List<Empleado> empleadosFiltrados = datosEmpleado.BuscarPorNombre(nombreBusqueda);
                GridViewEmpleados.DataSource = empleadosFiltrados;
                GridViewEmpleados.DataBind();
            }
            else
            {
                Mostrar();
            }
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            Mostrar();
        }


    }
}

