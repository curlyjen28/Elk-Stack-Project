# README - Ansible Files

The following files are used to deploy the ELK Container and monitor the web servers using filebeat and metricbeat

- ansible_config: Used by Ansible for configuration purposes
- filebeat-config.yml: Configuration file for Filebeat when installing
- filebeatplaybook.yml: Ansible playbook used to install and configure filebeat on web servers
- hosts.yml: Tells Ansible about the hosts that it can connect to
- installelk.yml: Uses Ansible to install and configure the ELK Stack
- metricbeatplaybook.yml: Ansible playbook used to install and configure metricbeat on web servers
- metricbeat-config.yml: Configuration file for Metricbeat when installing 
- pentest.yml: To install and configure the web servers
- remove-elk.yml: Uses Ansible to remove the ELK Stack (if needed)


### Sub Titles
