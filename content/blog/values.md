+++
author = "Stan "
categories = ["Go"]
date = "2017-11-10"
description = "在编译期间被创建并确定值，运行期不能改变值"
featured = "pic03.jpg"
featuredalt = "Pic 3"
featuredpath = "date"
linktitle = ""
title = "值 - (Values) "
type = "post"

+++

## 常量  For 循环
| 代码说明 | 代码 |
| --- | --- |
| 
```
Go 拥有各值类型，包括字符串，整形，浮点型，布尔型等。下面是一些基本的例子。

字符串可以通过 + 连接。

整数和浮点数

布尔型，还有你想要的逻辑运算符。
``` 
|
<a href="http://play.golang.org/p/KNLLSX4Io_"><img title="Run code" src="/img/code/play.png" class="run"></a>

```Go
package main  
import "fmt"  
 func main() {  
 
    fmt.Println("go" + "lang")  
 
    fmt.Println("1+1 =", 1+1)
    fmt.Println("7.0/3.0 =", 7.0/3.0)  
 
    fmt.Println(true && false)
    fmt.Println(true || false)
    fmt.Println(!true)
}  
``` 
|