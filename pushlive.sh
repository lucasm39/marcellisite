#!/bin/bash

echo "Pulling from Master"
git pull upstream master

echo "Pushing live!"
git push droplet master

echo "Sucess, site should be live in a couple seconds!"
