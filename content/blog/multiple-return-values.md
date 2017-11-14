+++
author = "stan.xii@gmail.com"
categories = ["Go"]
date = "2017-11-14T17:07:43+08:00"
description = ""
featured = "pic02.jpg"
featuredalt = "Pic 2"
featuredpath = "date"
linktitle = ""
title = "multiple-return-values"
type = "post"
+++


## 多返回值  (multiple-return-values)


Go 内建多返回值 支持。这个特性在 Go 语言中经常被用到，例如用来同时返回一个函数的结果和错误信息。

```
这里我们通过多赋值 操作来使用这两个不同的返回值

如果你仅仅想返回值的一部分的话，你可以使用空白定义符 _。

允许可变长参数是 Go 函数的另一个好的特性；我们将在接下来进行学习。
```



## go code.
```go
// Go 内建_多返回值_ 支持。这个特性在 Go 语言中经常被用到，
// 例如用来同时返回一个函数的结果和错误信息。

package main

import "fmt"

// `(int, int)` 在这个函数中标志着这个函数返回 2 个 `int`。
func vals() (int, int) {
    return 3, 7
}

func main() {

    // 这里我们通过_多赋值_ 操作来使用这两个不同的返回值。
    a, b := vals()
    fmt.Println(a)
    fmt.Println(b)

    // 如果你仅仅想返回值的一部分的话，你可以使用空白定
    // 义符 `_`。
    _, c := vals()
    fmt.Println(c)
}

// todo: named return parameters
// todo: naked returns

```