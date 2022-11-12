FROM ubuntu:latest

RUN apt-get -y update && apt-get -y install git wget unzip curl netcat rsync gpg pass

# Install fonts
WORKDIR /root/.local/share/fonts
WORKDIR /tmp
RUN wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip && unzip FiraCode.zip -d /root/.local/share/fonts

# Install Starship
RUN wget https://starship.rs/install.sh && chmod 700 install.sh && ./install.sh -y
RUN echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

ENTRYPOINT ["tail", "-f", "/dev/null"]