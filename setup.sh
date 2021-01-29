echo "Running Eneza Education Mock Setup"
ansible/ansible-playbook ansible/ssl_certificate.yml

echo "Updating Distro Packages"
ansible/ansible-playbook -i ansible/inventory.yml ansible/distro_update.yml

echo "Installing Nginx, Curl, NVM"
ansible/ansible-playbook -i ansible/inventory.yml ansible/install_node_nginx.yml

echo "Deploying Nodejs App to Remote Instance"
ansible/ansible-playbook -i ansible/inventory.yml ansible/deploy.yml