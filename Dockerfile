FROM ubuntu:latest

RUN apt-get update
RUN apt-get --assume-yes install software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get --assume-yes install neovim
RUN apt-get --assume-yes install python-dev python-pip python3-dev python3-pip
RUN apt-get --assume-yes install curl git

RUN useradd -ms /bin/bash developer
RUN chown developer -R /home/developer
USER developer
WORKDIR /home/developer/workspace
COPY --chown=developer init.vim /home/developer/.config/nvim/
COPY run /usr/local/bin

RUN nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
RUN nvim '+UpdateRemotePlugins' '+qall'

ENTRYPOINT ["sh", "/usr/local/bin/run"]
