FROM ubuntu:latest

RUN apt-get update
RUN apt-get --assume-yes install software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get --assume-yes install neovim
RUN apt-get --assume-yes install python-dev python-pip python3-dev python3-pip
RUN apt-get --assume-yes install curl git

COPY init.vim /root/.config/nvim/
RUN nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
RUN nvim '+UpdateRemotePlugins' '+qall'
