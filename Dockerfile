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
rm -rf /var/lib/apt/lists/*
EOT

RUN --mount=type=tmpfs,target=/tmp,size=100M <<EOT
cd /tmp
echo "Install Nerd Fonts"
mkdir -p /root/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip && unzip FiraCode.zip -d /root/.local/share/fonts
echo "Install Starship"
wget https://starship.rs/install.sh && chmod 700 install.sh && ./install.sh -y
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
cd
EOT

ENTRYPOINT ["tail", "-f", "/dev/null"]
