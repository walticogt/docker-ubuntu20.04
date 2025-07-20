# Ubuntu20.04 in Docker with VNC Server 5901 y 6901 en Web, SSH preconfigurado 2222

# Requisitos:
	Clonar el proyecto
 	chmod +x setup_ssh.sh
	docker-compose up -d
 	

# Requiere VNC para conectarte (no requieres password):
	https://www.realvnc.com/es/connect/download/viewer/

# VNC Accesible por web 
	http://localhost:6901 
 	Contraseña: vncpassword
	Contraseña root: toor

# Para ver el Log
	docker logs ubuntu-vnc-container
 
# Para entrar al Docker a su terminal
	docker exec -it ubuntu-vnc-container /bin/bash

# Ejecutar el script dentro de su terminal del contenedor para instalar SSH en el puerto 2222:22  
	/etc/cont-init.d/99-setup_ssh 

# Confirme el servicio SSH no se detenga, iniciar despues de cada reinicio.
	ss -tuln | grep 22
 	service ssh start

