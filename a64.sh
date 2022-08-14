#!/data/data/com.termux/files/usr/bin/bash 

#Setup
# shopt -s expand_aliases
infoClr="\e[34m"
errClr="\e[31m"
defClr="\e[0m"
info() { echo -e "${infoClr}I: ${*}${defClr}";:; }
err() { echo -e "${errClr}E: ${*}${defClr}"; exit 1;:; } 

curArch=$(uname -m)
tmpDir=$HOME/dltmp 

jvrgx='"[^"]*"'
isJavaInstalled() { if [ -e "$PREFIX"/bin/java ] || [ -e "$PREFIX"/share/jvm/openjdk-11.0.1/bin/java ] || [ -e "$PREFIX"/share/jdk8/bin/java ]; then info "It looks like you already have Java $(java -version 2>&1 | grep -o $jvrgx) installed. Exiting..."; exit 0; fi;:; }
checkForWget() { if ! command -v wget >/dev/null 2>&1; then info "'wget' not found, installing..."; pkg install wget -y; fi;:; }
createTmpDir() { info "Creating a temporary directory. (Located at ${tmpDir})"; mkdir $tmpDir; cd $tmpDir;:; }
installSuccess() { info "Please restart your Termux session."; info "Check Java by running 'java -version'"; exit 0;:; } 

installOPJDK11() {
    info "Installing OpenJDK11 for ${curArch}"
    checkForWget
    createTmpDir
    
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/v2.0/openjdk11.deb
    wgtStatusCode=$?
    
    if [[ $wgtExitCode -eq 0 ]]; then
        dpkg -i openjdk11.deb || err "An error occurred while trying to install openjdk11.deb"
        cd $PREFIX/share/jvm/openjdk-11.0.1/bin/
        chmod +x *
        
        info "OpenJDK11 has been installed successfully!"
        installSuccess
    fi
    
    err "An error occurred while trying to fetch openjdk11.deb"
} 

installJDK11JVD() {
    info "Installing JDK11 from JVDroid for ${curArch}"
    checkForWget
    createTmpDir
    
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/v2.0/openjdk11_jvdroid.deb
    wgtExitCode=$?
    if [[ $wgtExitCode -eq 0 ]]; then
        dpkg -i openjdk11_jvdroid.deb || err "An error occurred while trying to install openjdk11_jvdroid.deb."
        
        info "JDK11 from JVDroid has been installed successfully!"
        info "Note: The JDK11 you installed is a partial JDK and not a full JDK, if you want to install the full version select '1' in the selection."
        installSuccess
    fi
        
    err "An error occurred while trying to fetch openjdk11_JVDroid.deb"
} 

installOPJDK8DEB() {
    info "Installing JDK8 for ${curArch}"
    checkForWget
    createTmpDir
    
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/v2.5/openjdk_8.0_aarch64.deb
    wgtExitCode=$?
    if [[ $wgetExitCode -eq 0 ]]; then
        dpkg -i openjdk_8.0_aarch64.deb || err "An error occurred while trying to install openjdk_8.0_aarch64.deb"
        echo "export JAVA_HOME=$PREFIX/share/jdk8" >> $HOME/.profile
        echo "PATH=$PREFIX/share/jdk8/bin:$PATH" >> $HOME/.profile
        export JAVA_HOME=$PREFIX/share/jdk8
        PATH=$PREFIX/share/jdk8/bin:$PATH
        
        cd $PREFIX/share/jdk8/bin
        chmod +x *
        
        info "OpenJDK8 has been installed successfully!"
        installSuccess
    fi
    
    err "An error occurred while trying to fetch openjdk_8.0_aarch64.deb"
} 

installJDK9() {
    info "Installing JDK9 for ${curArch}"
    checkForWget
    createTmpDir
    
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/OpenJDK9/alsa-lib_1.1.3_${curArch}.deb
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/OpenJDK9/openjdk-9-jre-headless_9.2017.8.20-1_${curArch}.deb
    wget https://github.com/suhan-paradkar/java-in-termux/releases/download/OpenJDK9/openjdk-9-jdk-headless_9.2017.8.20-1_${curArch}.deb
    wgetExitCode=$?
    if [[ $wgetExitCode -eq 0 ]]; then
        pkg in ./alsa-lib_1.1.3_${archname}.deb ./openjdk-9-jre-headless_9.2017.8.20-1_${archname}.deb ./openjdk-9-jdk-headless_9.2017.8.20-1_${archname}.deb || err "An error occurred while trying to install (alsa-lib_1.1.3_${curArch}, openjdk-9-jre-headless_9.2017.8.20-1_${curArch}, openjdk-9-jdk-headless_9.2017.8.20-1_${curArch})"
        
        info "Java 9 has been installed successfully!"installSuccess
        installSuccess
    fi
    
    err "An error occurred while trying to fetch (alsa-lib_1.1.3_${curArch}, openjdk-9-jre-headless_9.2017.8.20-1_${curArch}, openjdk-9-jdk-headless_9.2017.8.20-1_${curArch})"
} 

startInstall() {
    read -p "
Please select a JDK version to install
    1) OpenJDK11 (Recommended)[~231MB]
    2) JDK11 from JVDroid (not standalone may be buggy)[~20MB]
    3) JDK8 by hax4us, compiled into deb by me [~70MB]
    4) JDK9
Select one: " prmpt
    
    case $prmpt in
        1) installOPJDK11 ;;
        2) installJDK11JVD ;;
        3) installOPJDK8DEB ;;
        4) installJDK9 ;;
        *) err "Invalid option ${slopt}." ;;
    esac
} 

#Greetings then start.
info "Welcome to the Java installer utility script for Termux"
isJavaInstalled
startInstall
