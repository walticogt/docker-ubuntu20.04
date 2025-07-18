# docker-ubuntu20.04 in Docker with VNC Server

# Desde powershell donde se encuentra "docker-compose.yml"
	docker-compose up -d

# Requiere VNC para conectarte (no requieres password):
	https://www.realvnc.com/es/connect/download/viewer/

# Accesible por web (vncpassword)
	http://localhost:6901 

# Para entrar al Docker a su terminal
	docker exec -it ubuntu-vnc-container /bin/bash

# Para ver el Log de carga
	docker logs ubuntu-vnc-container

# En caso no se ejecutó el script: setup_ssh.sh 
	/etc/cont-init.d/99-setup_ssh 

# clave: vncpassword
# clave root: toor

