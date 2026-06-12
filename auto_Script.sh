#!/bin/bash
# ============================================================
#  INSTALL + SETUP SCRIPT FOR:
#  3-Tier-Java-MySQL-Local project
#  Fixes all errors, removes interactive MySQL prompts,
#  installs Java, Maven, MySQL, builds project, runs JAR.
# ============================================================

echo "=== Updating Ubuntu packages ==="
sudo apt update -y

echo "=== Installing MySQL Server ==="
sudo apt install -y mysql-server

echo "=== Configuring MySQL root user ==="
# Set root password and enable password login
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Test@123';
FLUSH PRIVILEGES;
EOF

echo "=== Creating MySQL user + database ==="
sudo mysql -u root -p"Test@123" <<EOF
CREATE USER IF NOT EXISTS 'adi'@'localhost' IDENTIFIED BY 'Test@123';
CREATE DATABASE IF NOT EXISTS bankdb;
GRANT ALL PRIVILEGES ON bankdb.* TO 'adi'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "=== Cloning Java project ==="
git clone https://github.com/92usman/3-Tier-Java-MySQL-Local-main.git

cd 3-Tier-Java-MySQL-Local-main/

echo "=== Installing Java 17 ==="
sudo apt install -y openjdk-17-jre-headless

echo "=== Installing Maven ==="
sudo apt install -y maven

echo "=== Compiling project ==="
mvn compile

echo "=== Running tests ==="
mvn test

echo "=== Packaging JAR ==="
mvn package

echo "=== Running application ==="
cd target/
java -jar bankapp-0.0.1-SNAPSHOT.jar
