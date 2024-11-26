using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Entidades;
using System.Runtime.Remoting.Contexts;

namespace Datos
{
    public class DatosEmpleado
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["ConexionEmpleados"].ConnectionString;


        //OBTENER EMPLEADOS
        public List<Empleado> ObtenerEmpleados()
        {
            List<Empleado> empleados = new List<Empleado>();

            using(SqlConnection conexion = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Empleados", conexion);
                conexion.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Empleado empleado = new Empleado
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Salario = Convert.ToInt32(reader["Salario"])
                    };

                    empleados.Add(empleado);
                }
            }
            return empleados;
        }

        //CREAR EMPLEADO
        public int CrearEmpleado(Empleado empleado)
        {
            using (SqlConnection conexion = new SqlConnection(connectionString)) 
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Empleados(Nombre, Apellido, CorreoElectronico, Salario) " +
                    "VALUES(@Nombre,@Apellido,@CorreoElectronico,@Salario)", conexion);

                cmd.Parameters.AddWithValue("@Nombre", empleado.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", empleado.Apellido);
                cmd.Parameters.AddWithValue("@CorreoElectronico", empleado.CorreoElectronico);
                cmd.Parameters.AddWithValue("@Salario", empleado.Salario);
                conexion.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }

        }

        //MODIFICAR EMPLEADO
        public void ModificarEmpleado(Empleado empleado)
        {
            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Empleados SET Nombre = @Nombre, Apellido = @Apellido, " +
                    "CorreoElectronico = @CorreoElectronico, Salario = @Salario WHERE Id = @Id", conexion);

                cmd.Parameters.AddWithValue("@Nombre", empleado.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", empleado.Apellido);
                cmd.Parameters.AddWithValue("@CorreoElectronico", empleado.CorreoElectronico);
                cmd.Parameters.AddWithValue("@Salario", empleado.Salario);
                cmd.Parameters.AddWithValue("@Id", empleado.Id);

                conexion.Open();
                cmd.ExecuteNonQuery();
            }
        }


        //BORRAR EMPLEADO

        public void BorrarEmpleado(int empleadoId)
        {
            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Empleados WHERE Id=@Id", conexion);

                cmd.Parameters.AddWithValue("@Id", empleadoId);
                conexion.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // OBTENER EMPLEADO POR ID
        public Empleado ObtenerEmpleadoPorId(int id)
        {
            Empleado empleado = null;

            using (SqlConnection conexion = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Empleados WHERE Id = @Id", conexion);
                cmd.Parameters.AddWithValue("@Id", id);
                conexion.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    empleado = new Empleado
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Salario = Convert.ToInt32(reader["Salario"])
                    };
                }
            }

            return empleado;
        }

        //BUSCAR POR NOMBRE CON LINQ
        public List<Empleado> BuscarPorNombre(string nombre)
        {
            List<Empleado> empleados = ObtenerEmpleados();
            var empleadosFiltrados = empleados.Where(e => e.Nombre.ToLower().Contains(nombre.ToLower())).ToList();
            return empleadosFiltrados;
        }
    }
}
