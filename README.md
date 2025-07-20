# Ubuntu20.04 in Docker with VNC Server 5901 y 6901 en Web, SSH preconfigurado 2222

# Requisitos:
	Clonar el proyecto
	docker-compose up -d

# Requiere VNC para conectarte (no requieres password):
	https://www.realvnc.com/es/connect/download/viewer/

# Accesible por web (vncpassword)
	http://localhost:6901 

# Para entrar al Docker a su terminal
	docker exec -it ubuntu-vnc-container /bin/bash

# Para ver el Log de carga
	docker logs ubuntu-vnc-container

# Ejecutar el script dentro de su terminal del contenedor para instalar SSH en el puerto 2222:22  
	/etc/cont-init.d/99-setup_ssh 

# Volver a ejecutar el comando anterior en caso reinicien o el servicio SSH se detenga, volver a inicializar, para revisar si esta escuchando.
	ss -tuln | grep 22

# clave: vncpassword
# clave root: toor

