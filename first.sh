#!/bin/bash

echo "Atenção: Este script irá instalar e configurar vários programas."
echo  "Recomendo que edite o script antes de executar e remova os programas que não deseja."
echo "Alguns processos podem exigir a intervenção para continuar."
echo "Após finalizar a execução desse script, reinicie o computador e rode o script second.sh."
echo "Fique atento ao que aparece na tela."
read -p "Pressione <ENTER> para continuar." pass

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando algumas dependências..."
sudo apt install software-properties-common apt-transport-https wget curl -y
sudo apt install openjdk-8-jdk openjdk-11-jdk -y

echo "Instalando o python 3..."
sudo apt-get install python3 python3-venv python3-pip -y

echo "Instalando o git..."
sudo apt install git -y

echo "Instalando a fonte Fira Code..."
sudo apt install fonts-firacode -y

echo "Instalando o docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "Instalando o docker compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER

sudo rm get-docker.sh

mkdir Work

echo "Gerando chave SSH para o git..."
read -p "Digite seu email utilizado no Github: " email
read -p "Digite seu nome utilizado no Github: " nome
ssh-keygen -t ed25519 -C "$email"
echo "A chave SSH se encontra em ~/.ssh/id_ed25519.pub"
echo "Copie e cole no campo 'SSH and GPC Keys' nas configurações do github"
git config --global user.name "$nome"
git config --global user.email "$email"
read -p "Pressione enter para continuar" pass

echo "Instalando o shell ZSH..."
sudo apt install zsh -y
chsh -s /bin/zsh

echo "Todos os programas foram instalados"
echo "Por favor, reinicie o computador"