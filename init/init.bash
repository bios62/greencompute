#!/bin/bash
#
#  Just a dummy script for teh time beeing 
#
sudo apt-get update
sudo apt-get install -y nginx
echo "<html><body><h1>Hello from Terraform and OCI!</h1></body></html>" | sudo tee /var/www/html/index.nginx-debian.html

