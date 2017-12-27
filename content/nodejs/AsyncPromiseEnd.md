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


## demo 1
```

var sleep = function (time) {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            resolve();
        }, time);
    })
};

var start = async function () {
    // 在这里使用起来就像同步代码那样直观
    console.log('start');
    await sleep(3000);
    console.log('end');
};

start();
```
控制台先输出start，稍等3秒后，输出了end。

基本规则
async 表示这是一个async函数，await只能用在这个函数里面。

await 表示在这里等待promise返回结果了，再继续执行。

await 后面跟着的应该是一个promise对象（当然，其他返回值也没关系，只是会立即执行，不过那样就没有意义了..）

获得返回值
await等待的虽然是promise对象，但不必写.then(..)，直接可以得到返回值。

```
var sleep = function (time) {
    return new Promise(function (resolve, reject) {
        setTimeout(function () {
            // 模拟出错了，返回 ‘error’
            reject('error');
        }, time);
    })
};

var start = async function () {
    try {
        console.log('start');
        await sleep(3000); // 这里得到了一个返回错误
        
        // 所以以下代码不会被执行了
        console.log('end');
    } catch (err) {
        console.log(err); // 这里捕捉到错误 `error`
    }
};
```

循环多个await
await看起来就像是同步代码，所以可以理所当然的写在for循环里，不必担心以往需要闭包才能解决的问题。

```
..省略以上代码

var start = async function () {
    for (var i = 1; i <= 10; i++) {
        console.log(`当前是第${i}次等待..`);
        await sleep(1000);
    }
};
```


### 值得注意的是，await必须在async函数的上下文中的。
```
..省略以上代码

let 一到十 = [1,2,3,4,5,6,7,8,9,10];

// 错误示范
一到十.forEach(function (v) {
    console.log(`当前是第${v}次等待..`);
    await sleep(1000); // 错误!! await只能在async函数中运行
});

// 正确示范
for(var v of 一到十) {
    console.log(`当前是第${v}次等待..`);
    await sleep(1000); // 正确, for循环的上下文还在async函数中
}
```

## 直接贴出代码，就不说明了。
```
import fs from 'fs';
import path from 'path';
import request from 'request';

var movieDir = __dirname + '/movies',
    exts     = ['.mkv', '.avi', '.mp4', '.rm', '.rmvb', '.wmv'];

// 读取文件列表
var readFiles = function () {
    return new Promise(function (resolve, reject) {
        fs.readdir(movieDir, function (err, files) {
            resolve(files.filter((v) => exts.includes(path.parse(v).ext)));
        });
    });
};

// 获取海报
var getPoster = function (movieName) {
    let url = `https://api.douban.com/v2/movie/search?q=${encodeURI(movieName)}`;

    return new Promise(function (resolve, reject) {
        request({url: url, json: true}, function (error, response, body) {
            if (error) return reject(error);

            resolve(body.subjects[0].images.large);
        })
    });
};

// 保存海报
var savePoster = function (movieName, url) {
    request.get(url).pipe(fs.createWriteStream(path.join(movieDir, movieName + '.jpg')));
};


(async () => {
    let files = await readFiles();

    // await只能使用在原生语法
    for (var file of files) {
        let name = path.parse(file).name;

        console.log(`正在获取【${name}】的海报`);
        savePoster(name, await getPoster(name));
    }

    console.log('=== 获取海报完成 ===');
})();
```




## demo2
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