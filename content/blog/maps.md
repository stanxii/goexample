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


## 映射 也叫key-value (map)

map 是 Go 内置关联数据类型（在一些其他的语言中称为哈希 或者字典 
```
要创建一个空 map，需要使用内建的 make:make(map[key-type]val-type).

使用典型的 make[key] = val 语法来设置键值对。

使用例如 Println 来打印一个 map 将会输出所有的键值对。

使用 name[key] 来获取一个键的值

当对一个 map 调用内建的 len 时，返回的是键值对数目

内建的 delete 可以从一个 map 中移除键值对

当从一个 map 中取值时，可选的第二返回值指示这个键是在这个 map 中。这可以用来消除键不存在和键有零值，像 0 或者 "" 而产生的歧义。

你也可以通过这个语法在同一行申明和初始化一个新的map。


注意一个 map 在使用 fmt.Println 打印的时候，是以 map[k:v k:v]的格式输出的

```

## Map code

```go
// _map_ 是 Go 内置[关联数据类型](http://zh.wikipedia.org/wiki/关联数组)（
// 在一些其他的语言中称为_哈希_ 或者_字典_ ）。

package main

import "fmt"

func main() {

    // 要创建一个空 map，需要使用内建的 `make`:
    // `make(map[key-type]val-type)`.
    m := make(map[string]int)

    // 使用典型的 `make[key] = val` 语法来设置键值对。
    m["k1"] = 7
    m["k2"] = 13

    // 使用例如 `Println` 来打印一个 map 将会输出所有的
    // 键值对。
    fmt.Println("map:", m)

    // 使用 `name[key]` 来获取一个键的值
    v1 := m["k1"]
    fmt.Println("v1: ", v1)

    // 当对一个 map 调用内建的 `len` 时，返回的是键值对
    // 数目
    fmt.Println("len:", len(m))

    // 内建的 `delete` 可以从一个 map 中移除键值对
    delete(m, "k2")
    fmt.Println("map:", m)

    // 当从一个 map 中取值时，可选的第二返回值指示这个键
    // 是在这个 map 中。这可以用来消除键不存在和键有零值，
    // 像 `0` 或者 `""` 而产生的歧义。
    _, prs := m["k2"]
    fmt.Println("prs:", prs)

    // 你也可以通过这个语法在同一行申明和初始化一个新的
    // map。
    n := map[string]int{"foo": 1, "bar": 2}
    fmt.Println("map:", n)
}
```
