**Hackerbooks2**

Hola de nuevo,

os paso de nuevo el ejercicio con la parte obligtoria reducida.

Me ha quedado un problema sin resolver.
Puedo añadir y quitar favoritos, casi sin problemas. El problema viene al quitar el ultimo favorito. Core Data da un error y la App deja de funcionar. Supongo que es es porque desaparece el Tag de Favorites, con lo cual cambia el numero de tags y demas, pero no he sido capaz de solucionarlo.

Por otro lado tenia un problema de que no era capaz de cargar con el ipad la primera vez. Llegaba a la creacion del bookVC antes de haber terminado  de descargar los datos del JSON en segundo plano. Lo he "resuelto" poniendo un rootVC temporal, hasta que se cargan los datos del JSON y entonces ya muestro el splitVC. Supongo que no es lo mas ortodoxo pero no se me ocurria otra cosa.

Tambien me ha pasado una cosa curiosa. He tenido que poner el atributo isFavorite del libro en opcional, porque si lo dejaba obligatorio daba una excepcion Core Data al guardar. El caso es que me ha empezado a pasar a raiz de cambiar la descarga del JSON a segundo plano. No se si tiene algo que ver (no le encuentro ninguna logica) o es que por el camino he roto algo, que sera lo mas posible. No le he encontrado explicacion ni solucion.

Un saludo,

             Luis Mª Tolosana