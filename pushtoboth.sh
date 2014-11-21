#!/bin/bash

echo "Pushing to github"
git add . --all
git commit -m "$@"
git push origin master

echo "Success!"

echo "Pushing live!"
git push droplet master

echo "Sucess, site should be live in a couple seconds!"
