# Aplicación WebForms en .NET Framework

Esta es una aplicación desarrollada en **ASP.NET WebForms** con una base de datos **SQL Server** lista para ser utilizada. La base de datos está hosteada en un servidor remoto y contiene datos precargados para su funcionamiento inmediato. También se incluye un script SQL para la creación de la base de datos en caso de que desees utilizar una base de datos local.

---

## Requisitos previos

Antes de ejecutar la aplicación, asegúrate de contar con lo siguiente instalado en tu sistema:

- **Visual Studio 2019 o superior** (con los workloads de desarrollo web y .NET Framework habilitados).
- **SQL Server** (puede ser una instancia local o remota).
- .NET Framework **4.x** (según la configuración del proyecto).

---

## Configuración y ejecución

### 1. Usar la base de datos remota (configuración predeterminada)

La aplicación está configurada para conectarse a una base de datos SQL Server hosteada en un servidor remoto. Esta configuración te permite ejecutar la aplicación sin cambios adicionales.  

Pasos para ejecutar:  
1. Clona o descarga este repositorio.  
2. Abre el archivo de solución (`.sln`) en Visual Studio.  
3. Asegúrate de que el proyecto WebForms está configurado como el **proyecto de inicio**:
   - Haz clic derecho en el proyecto WebForms dentro del **Explorador de soluciones** y selecciona `Establecer como proyecto de inicio`.  
4. Compila y ejecuta la aplicación desde Visual Studio.  

> **Nota:** Asegúrate de que tu máquina tenga acceso a Internet para conectarse al servidor remoto.

---

### 2. Usar una base de datos local

Si prefieres utilizar tu propia instancia de SQL Server local, sigue estos pasos:

1. Ve a la carpeta `Scripts` dentro de la solución y localiza el archivo `script.sql`.  
   Este archivo contiene las instrucciones para:
   - Crear la base de datos.
   - Crear las tablas necesarias.

2. Abre **SQL Server Management Studio (SSMS)** o cualquier otra herramienta para gestionar bases de datos, y ejecuta el archivo `script.sql` en tu instancia de SQL Server local.  

3. Una vez creada la base de datos, actualiza la cadena de conexión en el archivo `web.config` de la aplicación:  

   Busca el siguiente bloque en `web.config`:  

   ```xml
   <connectionStrings>
       <add name="DefaultConnection" connectionString="Server=nombre_servidor;Database=nombre_base_datos;User Id=usuario;Password=contraseña;" providerName="System.Data.SqlClient" />
   </connectionStrings>
