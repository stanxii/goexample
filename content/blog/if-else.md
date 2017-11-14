+++
author = "stan.xii@gmail.com"
categories = ["Go"]
date = "2017-10-31T17:07:43+08:00"
description = ""
featured = "pic02.jpg"
featuredalt = "Pic 2"
featuredpath = "date"
linktitle = ""
title = "Slice"
type = "post"

+++

## if/else 分支
```
if 和 else 分支结构在 Go 中当然是直接了当的了。

这里是一个基本的例子。

你可以不要 else 只用 if 语句。

在条件语句之前可以有一个语句；任何在这里声明的变量都可以在所有的条件分支中使用。

注意，在 Go 中，你可以不适用圆括号，但是花括号是需要的。
```

Go 里没有三目运算符，所以即使你只需要基本的条件判断，你仍需要使用完整的 if 语句

```go
// `if` 和 `else` 分支结构在 Go 中当然是直接了当的了。

package main

import "fmt"

func main() {

    // 这里是一个基本的例子。
    if 7%2 == 0 {
        fmt.Println("7 is even")
    } else {
        fmt.Println("7 is odd")
    }

    // 你可以不要 `else` 只用 `if` 语句。
    if 8%4 == 0 {
        fmt.Println("8 is divisible by 4")
    }

    // 在条件语句之前可以有一个语句；任何在这里声明的变量
    // 都可以在所有的条件分支中使用。
    if num := 9; num < 0 {
        fmt.Println(num, "is negative")
    } else if num < 10 {
        fmt.Println(num, "has 1 digit")
    } else {
        fmt.Println(num, "has multiple digits")
    }
}

// 注意，在 Go 中，你可以不适用圆括号，但是花括号是需
// 要的。

```