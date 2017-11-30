Storm
=====
This document describes how to set up [Storm][WEBSITE]
environment and get started with it.

Note that the steps below are written for Debian system. To perform the
setup on any other system, some of the steps below may have to be
modified.

[WEBSITE]: http://storm.apache.org/


Contents
--------
* [Install Storm locally](#install-storm-locally)
* [Install Eclipse](#install-eclipse)
* [Add Storm as development dependency](#add-storm-as-development-dependency)


Install Storm locally
---------------------
Perform the following steps to setup Storm on local system.

 1. Install JDK 8.

    1. Download JDK 8 and untar it.

            mkdir -p ~/opt
            cd ~/opt
            wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz
            tar -xzf jdk-8u152-linux-x64.tar.gz
            rm jdk-8u152-linux-x64.tar.gz

    2. Add Java to PATH.

            Edit ~/.bashrc and add:
                export JAVA_HOME=~/opt/jdk1.8.0_152

            Add :$JAVA_HOME/bin to the PATH

            . ~/.bashrc

    3. Check the Java installation by running the following commands.

            java -version
            javac -version
            which java

 2. Download 1.1.1 release of Storm and untar it.

        mkdir -p ~/opt
        cd ~/opt
        wget http://www-us.apache.org/dist/storm/apache-storm-1.1.1/apache-storm-1.1.1.tar.gz
        tar -xzf apache-storm-1.1.1.tar.gz
        rm -rf apache-storm-1.1.1.tar.gz

        Edit ~/.bashrc and add to PATH:
            :~/opt/apache-storm-1.1.1/bin

        . ~/.bashrc
        storm

If you want to be able to submit topologies to a remote cluster from
your machine, you should install a Storm release locally. Installing a
Storm release will give you the storm client that you can use to
interact with remote clusters. For developing and testing topologies in
local mode, it is recommended that you use Maven to include Storm as a
dev dependency for your project.


Install Eclipse
---------------
Perform the following steps to install Eclipse JEE Oxygen.

 1. Download Eclipse and untar it.

        mkdir -p ~/opt
        cd ~/opt
        wget http://eclipse.stu.edu.tw/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz
        tar -xvzf eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz
        rm eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz

 2. Edit configuration.

        cd ~/opt/eclipse
        Edit eclipse.ini add the following lines just before -vmargs:

            -vm
            /home/sunaina/opt/jdk1.8.0_152/bin/java

        Set -XX:MaxPermSize=256m -Xms256m, -Xmx512m appropriately

 3. Create link on desktop and open Eclipse.

    1. Right click on eclipse -> Send To -> Desktop (Create Link).

    2. Choose your workspace. Example: ~/eclipse-ws/storm


Add Storm as development dependency
-----------------------------------
To develop Storm topologies you need to have Storm jars in your
classpath. You can either include unpacked jars in the classpath of your
project or use Maven to include Storm as development dependency by
adding the following to your pom.xml.

 1. Perform step 1 from the first section if JDK is not already
    setup.

 2. Install Maven.

    1. Download Maven and untar it.

            mkdir -p ~/opt
            cd ~/opt
            wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
            tar -xvzf apache-maven-3.5.2-bin.tar.gz
            rm apache-maven-3.5.2-bin.tar.gz

    2. Add Maven to PATH.

            Edit ~/.bashrc and add to PATH:
                :~/opt/apache-maven-3.5.2/bin

            . ~/.bashrc
            mvn -v

 3. Add the following to your project's pom.xml.

        <dependency>
            <groupId>org.apache.storm</groupId>
            <artifactId>storm-core</artifactId>
            <version>1.1.1</version>
            <scope>provided</scope>
        </dependency>
