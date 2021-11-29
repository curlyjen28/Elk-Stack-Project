# Project-1
Project 1 Due 11/29/21
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

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
- Load balancers mitigate Denial of Service (DoS) attacks by providing a website with an external IP address that is accessed by the Internet. The load balancer receives   incoming traffic that comes into the website and distributes it across multiple servers. This helps distribute traffic evenly among servers while mitigating DoS           attacks. 

- A jump box is a secure computer that is only accessible by an administrator and it is only used for administrative tasks. If configured correctly, a jump box allows for   tighter security because it is a single point of access used for a single purpose. This is advantageous because it protects virtual machines from public 
  access. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system performance. 
- Filebeat monitors the log files or locations that you specify, including which files have changed and when. It forwards these logs to Elasticsearch or Logstash for   
  indexing. 
- Metricbeat is a lightweight shipped that can be installed on servers to periodically collect metrics from the operating system and from services running on the server.   It then takes the collected metrics and statistics and ships them to either Elasticsearch or Logstash. 

The configuration details of each machine may be found below.

|   Name   |  Function        | IP Address              | Operating System |
|----------|------------------|-------------------------|------------------|
| JumpBoxProvisioner | Gateway          | 10.0.0.4/20.84.19.101   | Linux            |
| Web-1              |VM/DVWA Container | 10.0.0.5                | Linux            |
| Web-2              |VM/DVWA Container | 10.0.0.6                | Linux            |
| Web-3              |VM/DVWA Container | 10.0.0.8                | Linux            |
| ELK1               | ELK Server       | 10.1.0.4/20.114.213.58  | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 173.49.243.247

Machines within the network can only be accessed by the Ansible Container running on the Jump Box.
- JumpBoxProvisioner, 10.0.0.4


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBoxProvisioner | Yes       |  173.49.243.247      |
|  Web-1             |  No       |    10.0.0.4          |
|  Web-2             |  No       |    10.0.0.4          |
|  Web-3             |  No       |    10.0.0.4          |
|  ELK1              |  No       |    10.0.0.4          |
|  Red-Team-LB       | Yes       |  173.49.243.247      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Manual configuration allows for potential human errors during deployment; whereas, automated deployments are tested for errors before being deployed.
- A single or multiple virtual machines can be deployed efficiently. 

The playbook implements the following tasks:
- Sets the remote user used to deploy the ELK Stack
- Installs docker.io
- Installs pip3
- Downloads, launches, and configures a docker ELK container
- Starts the docker service

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify, including which files have changed and when. It forwards these logs to Elasticsearch or Logstash for   
  indexing. 
- Metricbeat takes the metrics and statistics that it collects and ships them to ELK. Metricbeat helps you monitor your servers by collecting metrics from the system and   services running on the server. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Playbook file to Ansible.
- Update the hosts file to include the Webservers IP Addresses and ELKServer IP to the appropriate groups. 
- Run the playbook, and navigate to the Kibana page at[ELK public IP]/app/kibana to check that the installation worked as expected.



_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
