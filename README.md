# Eneza Education DevOps Tasks
This repo is an example of deploying a basic Nodejs app on AWS using Ansible. In creating this repo I assumed that you have installed a ansible packages in your local environment, and you have an account with AWS to spin up a test environment EC2 instance. On successful deployment, it will execute a basic nodejs application with a local file used as a database, with users details.

## Create AWS Instance
Login to your AWS and create EC2 instance running Ubuntu 18.02. When done, follow instructions on creating key-pair for ssh login and giving it the right permissions. In this example we assume you saved your ssh key in the home folder `/home/bling/eneza/eneza.pem`

## Clone this repo
Clone this repo on your local working environment. This repo contains community cookbook for installing NVM. When you run bash command `tree`, the folder should look like this:
.
├── ansible
│   ├── ansible-role-nvm
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── LICENSE
│   │   ├── README.md
│   │   └── tasks
│   │       ├── main.yml
│   │       └── nvm.yml
│   ├── deploy.yml
│   ├── distro_update.yml
│   ├── install_node_nginx.yml
│   ├── inventory.yml
│   ├── ssl_certificate.yml
│   └── templates
│       └── nginx.conf.j2
├── appjs
│   ├── db.json
│   ├── json-server-http.js
│   └── package.json
├── cert
├── LICENSE.md
├── README.md
└── setup.sh

# Running the playbooks
Find `setup.sh` and make it executable using `bash` command `chmod +x setup.sh`. When ready to deploy, execute the script to deploy your nodejs app. The following represents the key steps:

### Create SSL Certificates
The playbook `ssl_certificate.yml` creates 3 SSL documents in te folder *cert* This certificates are required to secure the app

### Update and Upgrade your instance
The playbook `distro_update.yml` runs package updates and upgrades on your newly installed EC2 instance. It is based on APT

### Install Curl, Wget, Nginx and Nodejs/NVM
The playbook `install_node_nginx.yml` installs curl and nginx on EC2 instance using APT. It utilizes a community cookbook to install Nodejs/NVM as a role.

### Deploy Nodejs Application
The playbook `deploy.yml` deploys the Nodejs application to the EC2 instance, copies the nginx configuration template, copies the SSL certs created and installs runtime node packages