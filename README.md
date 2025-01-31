# 🌐 AWS Web Application Deployment - Scope of Work (SOW) 📄

## 📑 Scope of Work: AWS Web Application Environment (Proof of Concept) ☁️

This README outlines the Scope of Work (SOW) for building a secure and scalable web application environment on AWS! 🎉

**⚠️  Important Note:** This project is a **proof of concept**. All resources will reside within the **Default VPC** and use the **same subnet** for simplicity.

## 🎯 Objectives

Design, deploy, and configure a secure, scalable web application environment in AWS.

## ➡️ Deliverables

*   Fully configured AWS environment with:
    *   EC2 instances for Tomcat, MySQL, RabbitMQ, and Memcached 🚀
    *   Application Load Balancer (ALB) ⚖️
    *   Auto Scaling Group 🔄
    *   Configured Route 53 Private Hosted Zone 🗺️
    *   Necessary Security Groups and Key Pairs 🔐
    *   User data scripts for service setup 📜

## 🛠️ Implementation Steps

### 1. Security Groups & Key Pairs 🔐

*   **Create Security Groups:**
    *   `sg-applb`: 🌐 For Application Load Balancer - Allow HTTP (80) and HTTPS (443) from anywhere (0.0.0.0/0).
    *   `sg-app-ec2`: 🐱‍💻 For EC2 Tomcat instances - Allow port 8080 from `sg-applb`, Allow SSH (22) from *your IP*.
    *   `sg-backend-ec2`: 🗄️ For backend EC2 instances (MySQL, RabbitMQ, Memcached) - Allow all traffic from `sg-app-ec2` AND all traffic from `sg-backend-ec2` (or specific ports for MySQL, RabbitMQ, Memcached from `sg-app-ec2`).
*   **Create Key Pairs:** 🔑
    *   Generate key pairs for SSH access to EC2 instances.

### 2. EC2 Instances & Service Setup 🖥️

*   **Launch EC2 Instances:**
    *   Tomcat (Application Server) ☕
    *   MySQL (Database) 🛢️
    *   RabbitMQ (Message Queue) 🐇
    *   Memcached (Caching) ⚡
*   **Configuration:**
    *   Assign appropriate Security Groups created in Step 1.
    *   Associate Key Pairs for SSH access.
    *   Use user data scripts (found in the `resources` folder 📂) to automatically install and configure services on each instance during boot.

### 3. Route 53 Private Hosted Zone 🗺️

*   **Create Private Hosted Zone:**
    *   Set up a private hosted zone in Route 53.
    *   Define a domain name (e.g., `myapp.local`).
*   **Create Records:**
    *   For each EC2 instance (Tomcat, MySQL, RabbitMQ, Memcached), create an `A` record mapping its name (e.g., `tomcat.myapp.local`) to its private IP address.

### 4. Application Load Balancer & Target Group ⚖️

*   **Create Application Load Balancer:**
    *   Set up an ALB.
*   **Create Target Group:**
    *   Create a target group for the web application.
    *   Register the EC2 Tomcat instances as targets.
*   **Create Route 53 Record (Optional):**
    *   Create a record for the load balancer in your domain name provider or Route 53, if you need the application to be accessible via a specific domain.

### 5. Auto Scaling Group 🔄

*   **Create AMI:**
    *   Create an updated Amazon Machine Image (AMI) from a configured EC2 Tomcat instance.
*   **Launch Template:**
    *   Create a launch template based on the new AMI.
    *   Specify the `sg-app-ec2` security group.
*   **Auto Scaling Group:**
    *   Configure an Auto Scaling Group using the launch template.
    *   Set desired, minimum, and maximum capacity.
    *   Define scaling policies (e.g., based on CPU utilization).
    *   Associate the Auto Scaling group with the target group create in step 4.

## 📂 Resources Folder

The `resources` folder contains the user data scripts for setting up each service on the EC2 instances.

---

That's it! This document provides a roadmap for the proof of concept. Good luck with the project! 👍
