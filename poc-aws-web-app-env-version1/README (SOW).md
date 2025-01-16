//This Scope of Work (SOW) document outlines the objectives, deliverables, and implementation steps required to design, deploy, and configure a secure and scalable web application environment in the AWS cloud.

NOTE: This project is a proof of concept and all resources on Default VPC same subnet.

The SOW includes detailed steps for:


1. Create Security Groups AND Key Pairs
   sg-applb: for application load balancer allow http and https from anywhere
   sg-app-ec2: for ec2 tomcat instances allow port 8080 source sg-applb, allow port 22 ssh my ip
   sg-backend-ec2: for backend ec2 instances allow ports for mysql, Rabbitmq, memcached  or all traffic source sg-app-ec2 and all traffic source sg-backend-ec2
   
   Create Key Pairs for ec2 instances

2. Create Ec2 instances (tomcat, mysql, Rabbitmq, memcached) with appropriate security groups and key pairs for ssh connections
   Setup all services using user data scripts in resources folder

3. Setup DNS Route 53 for private hosted zone  
   Create host zone and give domain name 
   Create records with the same ec2 names with A record and ip private of ec2 

4.Create application load balancer
 taraget group: ec2 instances web app
 crete record for the lb in the domain name provider or route 53

.5 Create autoscaling group
   create updated ami for ec2 app
   lanched template 
   configure autoscaling group with autoscaling policy


