+++
author = "Stan xx"
categories = ["Nginx"]
date = "2017-11-10"
description = "在编译期间被创建并确定值，运行期不能改变值"
featured = "pic03.jpg"
featuredalt = "Pic 3"
featuredpath = "date"
linktitle = ""
title = "Nginx UV 独立ip访问计数统计 - (counter ips visit) "
type = "post"

+++

## 统计独立ip数
Recently, many referer spam hit on my server, below is the command I used to find and count the IP Address from a Nginx access log file.

```
$ sudo awk '{print $1}' /var/log/nginx/goexample.log | sort | uniq -c | sort -nr
```
A example
```
[root@iZj6cbv0sbzom9p7hjovcuZ nginx]# sudo awk '{print $1}' /var/log/nginx/goexample.log | sort | uniq -c | sort -nr
     25 103.206.191.165
      4 67.183.125.48
      3 123.59.146.153
      3 120.132.3.151
      2 111.162.152.62
      1 76.121.169.209
      1 59.110.6.177
      1 172.104.108.109
      1 169.54.233.116
      1 139.162.119.197
      1 106.11.226.213
```

## 统计可疑ip访问详情列表
```
sudo cat /var/log/nginx/goexample.log | grep 103.206.191.*
```

Example

```
[root@iZj6cbv0sbzom9p7hjovcuZ nginx]# sudo cat /var/log/nginx/goexample.log | grep 103.206.191.*
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /css/main.css HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /css/add-on.css HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /js/util.js HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /img/2017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /js/main.js HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /js/backToTop.js HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /img/2014/09/pic03.jpg HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /img/2014/04/pic02.jpg HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /img/2014/04/pic01.jpg HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /img/main/logo.jpg HTTP/1.1" 304 0 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:56 +0800] "GET /date2017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:17:57 +0800] "GET /img//pic03.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:18:19 +0800] "GET /favicon.ico HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:19:58 +0800] "GET /img/2017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:19:58 +0800] "GET /date2017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:19:58 +0800] "GET /img//pic03.jpg HTTP/1.1" 404 9761 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /blog/constants/ HTTP/1.1" 200 30757 "http://goexample.cn/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img/2017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img//pic03.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img/2014/092014/09/pic03.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img/2017/102017/10/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /date2014/09/pic03.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img/2014/042014/04/pic02.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
103.206.191.165 - - [10/Nov/2017:14:20:01 +0800] "GET /img/2014/042014/04/pic01.jpg HTTP/1.1" 404 9761 "http://goexample.cn/blog/constants/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"

```