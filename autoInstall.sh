#!/bin/bash
#Variable pour toutes les couleur utiliser dans le script

noir='\E[30m'
rouge='\E[31m'
vert='\E[32m'
jaune='\E[33m'
bleu='\E[34m'
magenta='\E[35m'
cyan='\E[36m'
blanc='\E[37m'

init="tput sgr0"

#Variable pour string utiliser dans tous le script
terminer="Installation terminer"

echo -e "$jaune""Ce script va vous permettre d'installer un ensemble de logiciel après une installation"
echo "Vous souhaiter installer quoi [all/qtcreator/java-jdk-8/java-jdk-11] ?"
$init
read input

if [ $input == "all" ]; then
	echo -e "$rouge""Installation de tous les paquets demander.."
    $init
	sudo apt update -y
	sudo apt full-upgrade -y
    echo ""
    echo -e "$rouge""Installation des paquets chromium, filezilla, git et vlc"
    $init 
	sudo apt install chromium-browser filezilla git vlc -y
    echo ""
    echo -e "$rouge""Installation de teamviewer.."
    $init
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
	sudo apt deb teamviewer_amd64.deb
	rm teamviewer_amd64.deb
	sudo apt install -f -y
	sudo apt update
    echo ""
    echo -e "$rouge""Installation de openSSH client et serveur.."
    $init
	sudo apt install openssh-{server,client} -y
	sudo apt update
	echo -e "$rouge""$terminer"

elif [ $input == "qtcreator" ]; then
	echo "$rouge Installation des paquets pour qtcreator.."
    $init
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install qtcreator qt5-default qtbase5-dev -y
	sudo apt update
	echo -e "$rouge""$terminer"

elif [ $input == "java-jdk-8" ]; then
	echo "$rouge""Installation des paquets pour openjdk-8.."
    $init
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install openjdk-8-jdk -y
	sudo apt update
	echo -e "$rouge""$terminer"

elif [ $input == "java-jdk-11" ]; then
	echo "$rouge""Installation des paquets pour openjdk-11.."
    $init
	sudo apt update -y
	sudo apt full-upgrade -y
	sudo apt install openjdk-11-jdk -y
	sudo apt update
	echo -e "$rouge""$terminer"

else
	echo "$rouge""Rien a installer !"
    $init

fi
