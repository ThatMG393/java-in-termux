# openjdk-11.0.1 in Termux
This script will try to install Openjdk-11.0.1 in termux
# Installation
- git clone https://github.com/MrAdityaAlok/openjdk-in-termux.git
- cd openjdk-in-termux
- chmod +x install.sh
- ./install.sh
- Package is about 248MB and needs constant internet for proper installation

# Uninstall
To uninstall follow these instructions 
- rm -rf $PREFIX/share/openjdk-11.0.1 
- edit file $HOME/.profile and remove the following lines 
- export JAVA_HOME=$PREFIX/share/openjdk-11.0.1 and
- PATH=$PATH:$PREFIX/share/openjdk-11.0.1/bin

# Issues ??
Feel free to create an issue in github

# Author
- MrAdityaAlok
