#!/bin/bash

echo "Pushing to master github!"
git add . --all
git commit -m $1
git push origin

echo "Pushing live!"
git push droplet master

echo "Sucess, site should be live in a couple seconds!"
