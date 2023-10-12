# Trabajo Final C# .NET Framework
## En desarrollo

Este proyecto se enfocó en la creación de un sistema de gestión de catálogos que emula un entorno de comercio electrónico, haciendo uso de las tecnologías C#, .NET Framework, ADO .NET y SQL Server Management. El propósito principal fue diseñar una aplicación que permitiera a los usuarios explorar una tienda en línea y gestionar sus perfiles de usuario de manera eficiente.


## CARACTERISTICAS:

**Conexión Manual a la Base de Datos**: 
Se crearon conexiones desde cero, incluyendo el uso de consultas embebidas, para acceder a una base de datos en SQL Server. Estas conexiones se diseñaron manualmente y se utilizan para almacenar información crítica, como datos de productos, registros de usuarios y preferencias.

**Interfaz de Acceso y Registro**: 
Los usuarios tienen la opción de iniciar sesión con sus credenciales o crear nuevas cuentas. Se aplicaron rigurosas medidas de seguridad para proteger la confidencialidad de los datos de usuario.

**Manejo de Excepciones**:
Se incorporaron estrategias tanto específicas como genéricas para el manejo de errores en la aplicación. Se implementó una pantalla de error que proporciona información relevante y orientación al usuario, asegurando una experiencia más amigable y facilitando la resolución de problemas.

**Diferenciación de Tipos de Usuarios**: 
Se estableció una distinción entre usuarios "administradores" y usuarios regulares. Los administradores tienen acceso a una pantalla de listado de productos, lo que les permite realizar una variedad de acciones, incluyendo la posibilidad de agregar nuevos artículos, modificar detalles existentes, eliminar elementos de la base de datos y llevar a cabo búsquedas. Estas búsquedas pueden ser rápidas, enfocadas únicamente en el nombre del producto, o avanzadas, lo que permite búsquedas más específicas basadas en criterios como nombre, código, precio y marca del producto.

**Visualización de Productos**:
Los usuarios pueden explorar una amplia variedad de productos, independientemente de si han iniciado sesión o no.

**Pantalla de "Mi Perfil"**:
Los usuarios pueden acceder a una pantalla personalizada de "Mi Perfil", donde pueden personalizar su información de usuario y avatar. Esta función está disponible para todos los usuarios logueados.

**Guardado de Productos Favoritos**: 
Los usuarios cuentan con la posibilidad de marcar productos como favoritos, lo que facilita la gestión de elementos de interés y simplifica futuras interacciones con dichos productos.
