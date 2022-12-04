# syntax=docker/dockerfile:1.4

FROM ubuntu:latest


RUN <<EOT
apt-get -y update
apt-get -y upgrade
apt-get -y install \
    git \
    wget \
    unzip \
    curl \
    netcat \
    rsync \
    gpg \
    pass \
    openssh-server
EOT

# Install fonts
WORKDIR /tmp
RUN <<EOT
mkdir -p /root/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip && unzip FiraCode.zip -d /root/.local/share/fonts
EOT

# Install Starship
RUN <<EOT
wget https://starship.rs/install.sh && chmod 700 install.sh && ./install.sh -y
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
EOT

ENTRYPOINT ["tail", "-f", "/dev/null"]