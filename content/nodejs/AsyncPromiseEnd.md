+++
author = "Stan"
categories = ["Node.js"]
date = "2017-12-27"
description = "Async await 等待 fs.createReadStream读取所有文件结束的Promise包装方法"
featured = "pic01.jpg"
featuredalt = "Pic 3"
featuredpath = "date"
linktitle = "async/await promise"
title = "Async/await 等待 Promise"
type = "post"
+++

##  Async await 等待 fs.createReadStream读取所有文件结束的Promise包装方法

怎样让async 异步 函数读取csv 所有行结束后才返回数组结果。
```
const file = "./szlc.csv"
async function papaFile(file) {

    let csvrows = [];

    let i = 0;
    fd = fs.createReadStream(file)
	.on('end', function() {
             //console.log("all csv done:", csvrows);
             return csvrows;
             
         });
	
	此处返回的是空的结果，因为上面	createReadStream是异步调用。所有papFile函数直接返回空结果。
	那么如何才能等待createReadStream结束在end的时候才返回结果呢？
	return 	 csvrows;
	
}
```

上面代码的问题引入如何async await 等待问。因为他们只能和Promise合作，如下英文描述

```	
async/await only works with promises, not with streams. There are ideas to make an extra stream-like data type that would get its own syntax, but those are highly experimental if at all and I won't go into details.

Anyway, your callback is only waiting for the end of the stream, which is a perfect fit for a promise. You'd just have to wrap the stream:

var fd = fs.createReadStream('/some/file/name.txt');
var hash = crypto.createHash('sha1');
hash.setEncoding('hex');
fd.on('end', function() {
    hash.end();
});
// read all file and pipe it (write it) to the hash object
fd.pipe(hash);

var end = new Promise(function(resolve, reject) {
    fd.on('end', ()=>resolve(hash.read()));
    fd.on('error', reject); // or something like that
});
Now you can await that promise:

(async function() {
    let sha1sum = await end;
    console.log(sha1sum);
}());
```

正确结果如上面的先包装一个Promise
```
        //wait for all promise wrape for waiting end.

        var end = new Promise( (resolve, reject) => {
             fd.on('end', () => { 

                //console.log("all end csv done:", csvrows);

                resolve(csvrows);
             });
             fd.on('error', reject); //or something like that
       });

       let res = await end

```
 通过包装end 为 Promise, 在通过 await end.这样就可以等待Promes的resolve 或者reject了


## 最后修改的源代码结果如下
```
const csv = require("csv-parse");
const fs = require('fs');


const file = "./szlc.csv"
async function papaFile(file) {

    let csvrows = [];

    let i = 0;
    fd = fs.createReadStream(file)
        .pipe(csv(['parnumber']))
        .on('data', function( row) {
            //console.log("csv row:", row[0]);
            if (i != 0 ) {
                csvrows.push(row[0]);
            }
            i = 1;
         })
         .on('end', function() {
             //console.log("all csv done:", csvrows);
             return csvrows;
             
         });

        //wait for all promise wrape for waiting end.

        var end = new Promise( (resolve, reject) => {
             fd.on('end', () => { 

                //console.log("all end csv done:", csvrows);

                resolve(csvrows);
             });
             fd.on('error', reject); //or something like that
       });

       let res = await end

       console.log("all outside csv done:", csvrows);
       return res;
}


async function run () {

   rows = await papaFile(file);
 
   console.log("all finished csv:", rows);
}
  
    run() 
    .catch( e => {
        console.log("parse csv error");
    });

```