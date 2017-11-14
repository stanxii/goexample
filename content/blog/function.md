+++
author = "stan.xii@gmail.com"
categories = ["Go"]
date = "2017-11-14T17:07:43+08:00"
description = ""
featured = "pic02.jpg"
featuredalt = "Pic 2"
featuredpath = "date"
linktitle = ""
title = "Function"
type = "post"
+++


## Function 函数
函数 是 Go 的中心。我们将通过一些不同的例子来进行学习

```
这里是一个函数，接受两个 int 并且以 int 返回它们的和

Go 需要明确的返回值，例如，它不会自动返回最后一个表达式的值

正如你期望的那样，通过 name(args) 来调用一个函数，

这里有许多 Go 函数的其他特性。其中一个就是多值返回，也是我们接下来需要接触的。
```

下一个例子: 多返回值

## go code.
```go
// _函数_ 是 Go 的中心。我们将通过一些不同的例子来
// 进行学习。

package main

import "fmt"

// 这里是一个函数，接受两个 `int` 并且以 `int` 返回它
// 们的和
func plus(a int, b int) int {

    // Go 需要明确的返回值，例如，它不会自动返回最
    // 后一个表达式的值
    return a + b
}

func main() {

    // 正如你期望的那样，通过 `name(args)` 来调用一
    // 个函数，
    res := plus(1, 2)
    fmt.Println("1+2 =", res)
}

// todo: coalesced parameter types

```