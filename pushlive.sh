#!/bin/bash

echo "Pulling from Master"
git pull

echo "Copying rss.xml"
rm -f rss.xml
jekyll build
cp -f _site/rss.xml rss.xml

echo "Updating Git"
git add . --all
git commit -m "Updated RSS"
git push origin master

echo "Pushing live!"
git push droplet master

echo "Sucess, site should be live in a couple seconds!"
