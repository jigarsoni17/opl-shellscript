#!/bin/bash

# Check Linux distribution
if [ -f /etc/lsb-release ]; then

    printf "\n"
    echo "--------------------- [ Ubuntu or Debian detected ] -----------------------------"
    printf "\n"

    sleep 6s

# Package update for UBUNTU
    sudo apt-get update > /dev/null 2>&1

    printf "\n"
    echo "--------------------- [ System is Updated ] -------------------------------------"
    printf "\n"


# Install JAVA Openjdk-8 on UBUNTU
    sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1

    printf "\n"
    echo "--------------------- [ Openjdk-8 Package is successfully installed ] -----------"
    printf "\n"


# Set an Environment variable for JAVA_HOME
    echo 'JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64/"' >> /etc/environment

    sleep 3s
    printf "\n"
    echo "--------------------- [ JAVA_HOME is Set ] --------------------------------------"
    printf "\n"


elif [ -f /etc/redhat-release ]; then

    printf "\n"
    echo "--------------------- [ RHEL or CentOS detected ] -------------------------------"
    printf "\n"

    sleep 6s

# Package update for UBUNTU
    sudo yum upadte -y  > /dev/null 2>&1

    printf "\n"
    echo "--------------------- [ System is Updated ] -------------------------------------"    
    printf "\n"

# Install JAVA Openjdk-8 on rhel
    sudo yum install java-1.8.0* -y > /dev/null 2>&1

    printf "\n"
    echo "--------------------- [ Openjdk-8 Package is successfully installed ] -----------"
    printf "\n"


# Set an Environment variable for JAVA_HOME
    echo 'JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.362.b08-1.el7_9.x86_64/jre"' >> /etc/environment

    sleep 3s
    printf "\n"
    echo "--------------------- [ JAVA_HOME is Set ] --------------------------------------"
    printf "\n"

fi 

# Install Maven 3.3.9 
sudo yum install wget -y > /dev/null 2>&1
cd /opt
sudo wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz > /dev/null 2>&1
sudo tar -xvf apache-maven-3.3.9-bin.tar.gz > /dev/null 2>&1
sudo mv apache-maven-3.3.9 maven


printf "\n"
echo "--------------------- [ Maven 3.3.9 is Successfully Installed ] -----------------"
printf "\n"


# Creating a softlink for bin file
ln -s /opt/maven/bin/mvn /usr/bin/mvn

printf "\n"
echo "--------------------- [ Maven Softlink is Created ] -----------------------------"
printf "\n"


# Remove extra Apache package for disk space
sudo rm -rf apache*


# Set an Environment variable for Maven 3.3.9
echo 'M2="/opt/maven/bin"' >> /etc/environment
echo 'M2_HOME="/opt/maven"' >> /etc/environment

sleep 3s
printf "\n"
echo "--------------------- [ M2 & M2_HOME is Set ] -----------------------------------"
printf "\n"

sleep 3s
printf "\n"
echo "********************* INSTALLATION IS SUCCESSFULLY COMPLETED !!! ****************"
printf "\n"
