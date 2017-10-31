#!/bin/sh

goexamplehome="/root/go/src/github.com/stanxii/goexample"
cd $goexamplehome
rm -rf public
hugo
rm -rf /usr/share/nginx/html/*
cp -a public/* /usr/share/nginx/html/
chmod -R 755 /usr/share/nginx/html/
