#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo service nginx start
sudo apt install -y tree stress jq yq
for X in {1..10}
do
echo "The Value Of X is $X"
echo "Welcome For The $X Time....!!"
sleep 1
done