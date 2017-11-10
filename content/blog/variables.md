+++
author = "Stan "
categories = ["Go"]
date = "2017-11-10"
description = "在编译期间被创建并确定值，运行期不能改变值"
featured = "pic03.jpg"
featuredalt = "Pic 3"
featuredpath = "date"
linktitle = ""
title = "变量 - (Variables) "
type = "post"

+++

## 常量  For 循环
| 代码说明 | 代码 |
| --- | --- |

| 
```
在 Go 中，变量 被显式声明，并被编译器所用来检查函数调用时的类型正确性

var 声明 1 个或者多个变量。

你可以申明一次性声明多个变量。

Go 将自动推断已经初始化的变量类型。

声明变量且没有给出对应的初始值时，变量将会初始化为零值 。例如，一个 int 的零值是 0。

:= 语句是申明并初始化变量的简写，例如这个例子中的 var f string = "short"。
``` 
|
<a href="http://play.golang.org/p/KNLLSX4Io_"><img title="Run code" src="/img/code/play.png" class="run"></a>

```Go
package main  
import "fmt"  
 func main() {  
 
    var a string = "initial"
    fmt.Println(a)  
 
    var b, c int = 1, 2
    fmt.Println(b, c)  
 
    var d = true
    fmt.Println(d)  
 
    var e int
    fmt.Println(e)  
 
    f := "short"
    fmt.Println(f)
}  
``` 
|