![Image description](https://i.imgur.com/MKiHvxh.png)

# MxM
Mexico x Mexico, reignite the Mexican fire.

## Landing page
Este repo es para almacenar el landing page del proyecto MxM.
Si quieres acceder al repo de la aplicación web, la aplicacón para IOS o el backend, te dejamos los links.

`IOS APP` https://github.com/Hackerciano/MxMiOS

`WEB APP` https://github.com/Aljorc/MxM-webapp

`LANDING PAGE` https://github.com/Aljorc/MxM-landing

`BACKEND` https://github.com/Aljorc/MxM-backend


## Punto de contacto 

El presente documento `README.md` contiene la descripción del proyecto y sus especificaciones, cual quier duda favor de enviar un correo electrónico a los siguientes descritos:
* graciano.diego@hotmail.com
* anna.hattyhat@gmail.com
* aljorc16@gmail.com

Teléfonos de contacto:
* 3331929721
* 3321179565
* 3321836646

![Image description](https://i.imgur.com/ten96rN.jpg)
![Image description](https://i.imgur.com/zLMt0vf.jpg)
![Image description](https://i.imgur.com/bJoc7pr.jpg)
![Image description](https://i.imgur.com/6YJ28xy.jpg)

* **Análisis del estatus quo**
  - MxM es un proyecto de Mexicanos para mexicanos, según el banco mundial, después de la contingencia sanitaria causada por el nuevo coronavirus SARS-Cov-2 o mejor conocido como Covid-19 será bastante abrupta ya que aproximadamente el PIB de México descenderá más de 4%, por dicha razón se presenta la siguiente propuesta de resolución al tema: **"Reactivación de la economía"**
  - Sectores mayormente afectados:
    - Turismo y Cultura (+24% PIB)
    - Producción (17% PIB 2019)
    - Construcción (12% PIB 2019)
    - Inversiones privadas
    - Protección de la estabilidad petrolera
  - A pesar de que el gobierno federal ya ha anunciado medidas económicas para hacer frente a esta crisis, no se tiene una solidez en el tema ya que muchas de las medidas que se pretenden tomar son las mismas que ya se están llevando a cabo, por lo cual es de suma importancia una solución sencilla, efectiva y concisa para hacer frente a una posible depresión del sistema económico del país.
  - Los sectores que se deben cuidar más son principalmente los bienes de la población, ya que al existir una población endeudada y sin flujo de capital muchos a falta de empleos terminarán acudiendo a hipotecar sus propiedades o a venderlas a precios de remate.
  - En resumen, se perderán más empleos y la gente endeudada no podrá pagarlas, esto incrementará desprendimiento de bienes y aumento de inseguridad consecuencia de la desesperación de salir adelante.

* **Propuesta**
  - ¿Que es?
    - Es una plataforma de inclusión financiera, laboral y económica en la cual se pretende existan varias herramientas que incentiven el flujo de capital y el comercio local, a través de tecnologías como GPS, códigos QR, mensajes de texto y push notifications, funciona como una comunidad de negocios los cuales intercambian descuentos tanto para los dueños de los mismos como para los empleados a modo de prestaciones.
  - ¿Que hace?
    - Funciona como un intermediario laboral entre empleador y empleado, implementando contratos laborales virtuales y contrataciones express por medio de contacto vía SMS o Push Notifications.
    - Ejecuta las funciones de gestor para empresas (principalmente Pymes) que deseen optar por solicitar estímulos fiscales, de esta manera se reduce el riesgo de pérdida de empleos y se aumenta el flujo de capital.
    - Crea alianzas entre empresas o comercios en los cuales los empleados de un negocio pueden obtener beneficios en otros comercios locales, de esta manera se incentiva el flujo de efectivo local. (controlados mediante códigos QR)
    - Oferta y búsqueda de servicios (oficios) en los cuales, se pretende la opción de incluir suscripciones a estos servicios (enfocado a empresas medianas) esto aportará mucho a el sector informal.
  - ¿Por qué utilizarla?
    -  Al utilizar esta plataforma apoyas a la economía Mexicana, mientras otro indirectamente te apoya a ti, la idea de MxM cómo su nombre lo indica va más allá de México por México, sino de Mano por Mano, todos al salir de esta crisis necesitaremos apoyar a otros y ser apoyados.
    - Da la oportunidad a las pYmes de crecer y mantenerse fuertes.
    - Creará empleos y aumentará la demanda de los servicios y oficios.
    - Impulsará el comercio local mediante alianzas y publicación de contratistas locales.

* **Tecnologías a utilizar**:
  - Para lograr el alcance deseado se optará por dividir la plataforma en dos sectores, móvil y web, de forma que administradores y cabezas de los negocios, pymes y empresas que deseen registrarse al programa MxM lo podrán hacer sin limitantes. La aplicación móvil será utilizada principalmente para prestadores de servicios, buscadores de empleos o empleados sin embargo administrativos de los sectores anteriores también podrán utilizarla para crear alianzas.
  - Web app angular
    - Responsive
    - Accesible mediante cualquier dispositivo
    - El backend se alojará en los servidores de AWS (S3).
    - Uso de big data para sectorizar a los apoyos y empleos. (MongoDB, frameworks & queries...)
  - Aplicación móvil
    - Prototipo funcional en dispositivo iOS (se enviará el enlace para descagar y probar la aplicación en vivo.)
    - Simple Notification Service (AWS).
    - Códigos QR para generar identidades únicas que darán acceso a empleados cuyas empresas hayan creado alianzas con otras a descuentos y promociones que incentiven el flujo de efectivo y generación de riqueza.
    
* **Uso del sistema**:
  - La aplicación es funcional tanto en iPhone como en iPad, se pretende en una segunda fase realizar la versión para Android, el equipo The White Shoe Team está consciente que la mayoría de la población Mexicana cuenta con un smartphone con sistema operativo Android, sin embargo para la finalidad del desarrollo del MVP se optó por desarrollar en Swift para iOS debido a los frameworks nativos que nos permitieron el desarrollo con mayor agilidad.
  - En caso de desear clonar el repositorio de iOS para probarlo en un dispositivo es necesario acceder a las propiedades de la aplicación, dirigirse a Build Settings y en "Swift compiler arrastrar el archivo "Header....h" ubicado en la raíz del proyecto, cualquier información referente a esta configuración puede referirse al siguiente enlace: https://medium.com/@thabodavidnyakalloklass/ios-push-with-amazons-aws-simple-notifications-service-sns-and-swift-made-easy-51d6c79bc206
  - Solicitar trabajo
    - Ingresar al sistema (sólo presionar el botón login, no existen contraseñas aún), dirigirse al botón de "trabajo" ubicado en el punto inferior de la pantalla, elegir una categoría y elegir un trabajo.
    - Ingresar un número celular a 10 dígitos (mexicano) el cual recibirá la confirmación de la aplicación al empleo.
  - Solicitar servicio
    - Ingresar al sistema (sólo presionar el botón login, no existen contraseñas aún), dirigirse al botón de "servicios" ubicado en el punto inferior de la pantalla, elegir un nombre de los que aparecen en el listado y presionar el botón de suscribirse.
    - Datos y flujo mockeado.
    - Permitir servicios de ubicación para una mayor precisión del mapa en tiempo real del usuario.
  - Crear alianza
    - Cambiar (si así lo desea) el nómbre del comercio ubicado en el archivo "AlliesViewController".
    - Lanzar la aplicación
    - Ingresar al sistema (sólo presionar el botón login, no existen contraseñas aún), dirigirse al botón de "alianzas" ubicado en el punto inferior de la pantalla, tocar el botón "Ver QR" y habilitar el switch
    - Hacer mismos pasos anteriores con otro dispositivo, pero este deberá seleccionarse la opción "escanear QR", escanear el código QR y tocar el botón "Confirmar"
    - Una push notification deberá llegar para confirmar la unión de ambos negocios.
    
* **Errores conocidos y recomendaciones**:
  - Usar por lo menos un dispositivo iOS con iOS 13.2 en adelante.
  - Usar el simulador del iPhone 11 o superior.
  - El sistema puede fallar si se intenta leer el QR de inmediato acabó de abrir la vista.
  - No tener bloqueado remitentes de mensajes de texto publicitarios, normalmente comienzan con (66) o son de 6 dígitos.
