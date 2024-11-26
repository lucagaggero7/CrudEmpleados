# Aplicación WebForms en .NET Framework

Esta es una aplicación desarrollada en **ASP.NET WebForms** con una base de datos **SQL Server**. La base de datos esta hospedada en un servidor remoto.

---

## **Requisitos previos**

Antes de ejecutar la aplicación, asegúrate de contar con lo siguiente instalado en tu sistema:

- **Visual Studio 2019 o superior** (con los workloads de desarrollo web y .NET Framework habilitados).
- **SQL Server** (puede ser una instancia local o remota).
- .NET Framework **4.x** (según la configuración del proyecto).

---

## **Configuración y ejecución**

### **1. Usar la base de datos remota (configuración predeterminada)**

Si deseas utilizar la base de datos remota, la aplicación ya está configurada para conectarse automáticamente a un servidor remoto de SQL Server. Solo necesitas seguir estos pasos:

#### Pasos para ejecutar:

1. **Clona o descarga** este repositorio en tu equipo.
2. **Abre el archivo de solución (`.sln`)** en Visual Studio.
3. **Restaurar los paquetes NuGet**:
   - Abre la consola del administrador de paquetes NuGet y selecciona el boton **Restaurar**.
   - O ejecuta el siguiente comando:
     ```bash
     Update-Package -Reinstall
     ```
4. **Configura el proyecto como el proyecto de inicio**:
   - Haz clic derecho sobre el proyecto WebForms en el **Explorador de soluciones** y selecciona `Establecer como proyecto de inicio`.
5. **Compila y ejecuta la aplicación** desde Visual Studio.

> **Nota:** Asegúrate de que tu máquina tenga acceso a Internet para conectarse al servidor remoto.

---

### **2. Usar una base de datos local**

Si prefieres utilizar una base de datos local, sigue estos pasos para configurar una instancia de SQL Server local:

#### Pasos para configurar la base de datos local:

1. **Clona o descarga** este repositorio en tu equipo.
2. **Ubica el archivo `script.sql`**:
   - Este archivo se encuentra en la carpeta `BD Script` dentro de la solución y contiene las instrucciones para crear la base de datos y las tablas necesarias.
   
3. **Ejecuta el script en SQL Server**:
   - Abre **SQL Server Management Studio (SSMS)** o cualquier otra herramienta para gestionar bases de datos.
   - Conéctate a tu instancia local de SQL Server y ejecuta el archivo `script.sql`.
  
4. **Abre el archivo de solución (`.sln`)** en Visual Studio.

5. **Restaurar los paquetes NuGet**:
   - Al igual que en la opción anterior, asegúrate de restaurar los paquetes NuGet:
   - Abre la consola del administrador de paquetes NuGet y selecciona el boton **Restaurar**.
   - O ejecuta el siguiente comando:
     ```bash
     Update-Package -Reinstall
     ```

6. **Actualizar la cadena de conexión**:
   - Después de crear la base de datos local, abre el archivo `web.config` en tu proyecto.
   - Localiza el siguiente bloque y actualiza la cadena de conexión con los valores de tu servidor y base de datos local:

   ```xml
   <connectionStrings>
       <add name="DefaultConnection" connectionString="Server=nombre_servidor;Database=nombre_base_datos;User Id=usuario;Password=contraseña;" providerName="System.Data.SqlClient" />
   </connectionStrings>
