# 3-Tier Java / MySQL Local main

This project is a 3‑tier Java application that uses:

- Java 17 for backend logic
- Maven for building and dependency management
- MySQL as the database layer

The setup process installs all required components, configures MySQL, builds the Java project, and runs the final JAR file.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [1. Setting Up Python Virtual Environment](#1-setting-up-python-virtual-environment)
  - [2. Installing PostgreSQL](#2-installing-postgresql)
  - [3. Setting Up PostgreSQL Database](#3-setting-up-postgresql-database)
- [Running the Application](#running-the-application)
- [License](#license)

## Prerequisites
Before setting up the project, ensure you have the following installed on your machine:

- Ubuntu (or another compatible Linux distribution)
- Java 17 (JRE)
- Maven
- MySQL Server

## Installation

### 1. Install Java 17

1. **Install Java Version 17:**

   ```bash
   sudo apt install -y openjdk-17-jre-headless
   ```
   
### 2. Install Maven

1. **Installing Maven**

  ```bash
  sudo apt install -y maven
   ```

### 3. Installing MySQL

1. **Install MySQ**

   ```bash
   sudo apt install -y mysql-server
   ```
### 4. Setting Up MySQL Database

1. **Configure the MySQL root user:**

  ```bash
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
   FLUSH PRIVILEGES;
  ```
2. **Create a new MySQL user and database:**

  ```bash
   sudo mysql -u root -p
   password
  ```

(Type this inside mysql)
  ```bash
   CREATE USER IF NOT EXISTS 'adi'@'localhost' IDENTIFIED BY 'Test@123';
   CREATE DATABASE IF NOT EXISTS bankdb;
   GRANT ALL PRIVILEGES ON bankdb.* TO 'adi'@'localhost';
   FLUSH PRIVILEGES;
  ```

### 5. Cloning and Building the Java Project

1. **Git clone the folder to move to the next step**

2. **Clone the GitHub repository:**

   ```bash
   mvn compile
   ```
3. **Run Test**

   ```bash
   mvn test
   ```

4. **Package the application:**

   ```bash
   mvn package
   ```

### 5. Running the Application

1. **Run the Application:**

   ```bash
   cd target/
   java -jar bankapp-0.0.1-SNAPSHOT.jar
   ```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

