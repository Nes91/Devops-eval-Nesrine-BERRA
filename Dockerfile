FROM ubuntu:22.04

# Installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Configuration SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Créer un utilisateur pour Ansible
RUN useradd -m -s /bin/bash ansible
RUN echo 'ansible:ansible123' | chpasswd
RUN usermod -aG sudo ansible
RUN echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Exposer le port SSH
EXPOSE 22

# Démarrer SSH
CMD ["/usr/sbin/sshd", "-D"]
