#!/bin/bash
# /etc/cont-init.d/99-setup_ssh

echo "Configurando el servidor SSH..."

# Configurar DEBIAN_FRONTEND para evitar preguntas interactivas durante la instalación
export DEBIAN_FRONTEND=noninteractive

# Instalar openssh-server si no está instalado
if ! dpkg -s openssh-server >/dev/null 2>&1; then
    echo "openssh-server no encontrado, instalando..."
    apt-get update && apt-get install -y openssh-server
    if [ $? -ne 0 ]; then
        echo "Error al instalar openssh-server. Revisa la conexión a Internet o los repositorios."
        exit 1
    fi
    echo "openssh-server instalado correctamente."
fi

# Configurar PermitRootLogin yes en sshd_config
# Usa sed para reemplazar o añadir la línea
if ! grep -q "PermitRootLogin yes" /etc/ssh/sshd_config; then
    echo "Configurando PermitRootLogin..."
    # Elimina líneas existentes y añade la nueva para asegurar
    sed -i '/^PermitRootLogin/d' /etc/ssh/sshd_config
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi

# Establecer la contraseña para el usuario root
# ¡Advertencia: 'toor' es una contraseña insegura para producción!
echo 'root:toor' | chpasswd

# Iniciar o reiniciar el servicio SSH
echo "Reiniciando servicio SSH..."
service ssh restart
if [ $? -ne 0 ]; then
    echo "Error al reiniciar el servicio SSH. Revisa los logs de SSH."
    exit 1
fi

echo "Configuración SSH completada."
