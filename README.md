##
# AUTOMATED ELK STACK DEPLOYMENT
##




The files in this repository were used to configure the network depicted below. 

**Diagram of virtual network including ELK Deployment** 

![Virtual Network Diagram with ELK Deployment](https://github.com/curlyjen28/Project-1/blob/main/Diagrams/FinalDiagram.png)

**Table of security group rules for the ELK Security Group (ELK1-nsg)**

![Elk Security Group Rules](https://github.com/curlyjen28/Project-1/blob/main/Diagrams/ELK1-nsgSecurity-Group-Rules.JPG)

**Table of security group rules for Red Team Security Group (RedTeamNSG)**

![Red Team Security Group Rules](https://github.com/curlyjen28/Project-1/blob/main/Diagrams/RedTeamNSGSecurity-Group-Rules.JPG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Playbook File may be used to install only certain pieces of it, such as Filebeat.

- [Playbook of YAML Files](https://github.com/curlyjen28/Project-1/tree/main/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting access to the network.
- Load balancers mitigate Denial of Service (DoS) attacks by providing a website with an external IP address that is accessed by the Internet. The load balancer receives incoming traffic that comes into the website and distributes it across multiple servers. This helps distribute traffic evenly among servers while mitigating DoS         attacks. 

- A jump box is a secure computer that is only accessible by an administrator and it is only used for administrative tasks. If configured correctly, a jump box allows for tighter security because it is a single point of access used for a single purpose. This is advantageous because it protects virtual machines from public access. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system performance. 
- Filebeat monitors the log files or locations that you specify, including which files have changed and when. It forwards these logs to Elasticsearch or Logstash for   indexing. 
- Metricbeat is a lightweight shipper that can be installed on servers to periodically collect metrics from the operating system and from services running on the server. It then takes the collected metrics and statistics and ships them to either Elasticsearch or Logstash. 

The configuration details of each machine may be found below.

|   Name   |  Function        | IP Address              | Operating System |
|----------|------------------|-------------------------|------------------|
| JumpBoxProvisioner | Gateway          | 10.0.0.4/20.84.19.101   | Linux/Ubuntu 18.04            |
| Web-1              |VM/DVWA Container | 10.0.0.5                | Linux/Ubuntu 18.04            |
| Web-2              |VM/DVWA Container | 10.0.0.6                | Linux/Ubuntu 18.04            |
| Web-3              |VM/DVWA Container | 10.0.0.8                | Linux/Ubuntu 18.04            |
| ELK1               | ELK Server/Diagnostic       | 10.1.0.4/20.114.213.58 | Linux/Ubuntu 18.04            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- host public IP (personal machine's IP - redacted for security purposes)

Machines within the network can only be accessed by the Ansible Container running on the Jump Box via the SSH protocol running on port 22.
- JumpBoxProvisioner, 10.0.0.4


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBoxProvisioner | Yes       |host public IP (personal machine's IP - redacted for security purposes)|
|  Web-1             |  No       |    10.0.0.4 (JumpBoxProvisioner)          |
|  Web-2             |  No       |    10.0.0.4 (JumpBoxProvisioner)         |
|  Web-3             |  No       |    10.0.0.4 (JumpBoxProvisioner)          |
|  ELK1              |  No       |    10.0.0.4 (JumpBoxProvisioner)         |
|  Red-Team-LB       | Yes       |host public IP (personal machine's IP - redacted for security purposes)|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Manual configuration allows for potential human errors during deployment; whereas, automated deployments are tested for errors before being deployed.
- A single or multiple virtual machines can be deployed efficiently. 

The playbook implements the following tasks:
- Sets the remote user used to deploy the ELK Stack
- Installs docker.io
- Install python3-pip
- Install docker module
- Downloads, launches, and configures a docker ELK container
- Starts the docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps output](https://github.com/curlyjen28/Project-1/blob/main/Images/dockerpsoutput.JPG)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify, including which files have changed and when. It forwards these logs to Elasticsearch or Logstash for   indexing. 
- Metricbeat takes the metrics and statistics that it collects and ships them to ELK. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server. 

### Kibana

After adding sample web log data to kibana, the following information was obtained:
- In the last 7 days, 224 unique visitors were located in India.
- In the last 24 hours, of the visitors from China, 13 were using Mac OSX.
- In the last 2 days, 5.74% of visitors received 404 errors and 2.73% received 503 errors.
- In the last 7 days, China produced the majority of the traffic on the website.
- Of the traffic coming from China, the time of day that had the highest amount of activity was 12:00 pm.
- The types of downloaded files that were identified for the last 7 days were:
  -  gz: compressed archive files
  -  css: cascading style sheet, used to define webpages
  -  zip: compressed archive files
  -  deb: debian package manager file
  -  rpm: red hat package management file
 
 After diving a bit deeper and looking at the chart that shows Unique Visitors Vs. Average Bytes, a time frame in the last 7 days with the most amount of bytes (activity) was identified. On Nov 29, 2021 @ 21:07:07:660, potentially strange activity is noted. A single user from India was responsible for downloading a 16,837 byte rpm (red hat package management) file. The user received the HTTP code 200 which indicates the request was successful. The Kibana Discover page provided the source IP for this activity as 81.32.253.92 and the geo coordinates of the activity as "lat": 47.25996056, "lon": -95.92809778. The source machine was running Windows 7 OS and the traffic originated from the following website: http://nytimes.com/success/lodewijk-van-den-berg. 
 
 In conclusion, this notable activity appears to be an individual downloading the metricbeat red hat package file. The file does not appear to be malicious as the red hat package file is used to collect log date. It is suspicious as the individual utilized a New York Times website to access the file and that is a strange place to obtain a link for metricbeat download. This may be a compliance issue as the individual downloaded a file from an untrusted website in Bangladesh.  

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to /etc/ansible/files
- Update the hosts.yml file to include the Webservers IP Addresses and ELKServer IP to the appropriate groups. 
- Copy filebeat-playbook.yml to /etc/ansible/roles. Navigate to the Kibana page at [ELK public IP]/app/kibana to check that the installation worked as expected.
- Install-elk.yml copied to /etc/ansible directory to run
- Edit hosts.yml file to identify the correct machine to run the playbook on by specifying the IP addresses in their appropriate groups
- http://20.114.213.58:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
