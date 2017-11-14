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


## 切片 (slice)

Slice 是 Go 中一个关键的数据类型，是一個比數組更加強大的数据结构


```go
// _Slice_ 是 Go 中一个关键的数据类型，是一個比数组更
// 加強大的序列介面

package main

import "fmt"

func main() {

    // 不像數組，slice 的類型僅由它所包含的元素決定（不像
    // 數組中還需要元素的個數）。要建立一個長度非零的空
    // slice，需要使用內建的方法 `make`。這裡我們建立了一
    // 個長度為3的 `string` 類型 slice（初始化為零值）。
    s := make([]string, 3)
    fmt.Println("emp:", s)

    // 我們可以和數組一樣設置和得到值
    s[0] = "a"
    s[1] = "b"
    s[2] = "c"
    fmt.Println("set:", s)
    fmt.Println("get:", s[2])

    // 如你所料，`len` 返回 slice 的長度
    fmt.Println("len:", len(s))

    // 作為基本操作的補充，slice 支持比數組更多的操作。
    // 其中一個是內建的 `append`，它返回一個包含了一個
    // 或者多個新值的 slice。注意我們接受返回由 append
    // 返回的新的 slice 值。
    s = append(s, "d")
    s = append(s, "e", "f")
    fmt.Println("apd:", s)

    // Slice 也可以被 `copy`。這裡我們建立一個空的和 `s` 有
    // 相同長度的 slice `c`，並且將 `s` 複製給 `c`。
    c := make([]string, len(s))
    copy(c, s)
    fmt.Println("cpy:", c)

    // Slice 支持通過 `slice[low:high]` 語法進行“切片”操
    // 作。例如，這裡得到一個包含元素 `s[2]`, `s[3]`,
    // `s[4]` 的 slice。
    l := s[2:5]
    fmt.Println("sl1:", l)

    // 這個 slice 從 `s[0]` 到（但是包含）`s[5]`。
    l = s[:5]
    fmt.Println("sl2:", l)

    // 這個 slice 從（包含）`s[2]` 到 slice 的後一個值。
    l = s[2:]
    fmt.Println("sl3:", l)

    // 我們可以在一行程式碼中聲明並初始化一個 slice 變數。
    t := []string{"g", "h", "i"}
    fmt.Println("dcl:", t)

    // Slice 可以組成多維數據結構。內部的 slice 長度可以嗎
    // 同，這和多位數組不同。
    twoD := make([][]int, 3)
    for i := 0; i < 3; i++ {
        innerLen := i + 1
        twoD[i] = make([]int, innerLen)
        for j := 0; j < innerLen; j++ {
            twoD[i][j] = i + j
        }
    }
    fmt.Println("2d: ", twoD)
}

```

##  slice
不像數組，slice 的類型僅由它所包含的元素決定（不像數組中還需要元素的個數）。要建立一個長度非零的空slice，需要使用內建的方法 make。這裡我們建立了一個長度為3的 string 類型 slice（初始化為零值）。
    s := make([]string, 3)
    fmt.Println("emp:", s)
我們可以和數組一樣設置和得到值

## 
作為基本操作的補充，slice 支持比數組更多的操作。其中一個是內建的 append，它返回一個包含了一個或者多個新值的 slice。注意我們接受返回由 append返回的新的 slice 值。
Slice 也可以被 copy。這裡我們建立一個空的和 s 有相同長度的 slice c，並且將 s 複製給 c
Slice 支持通過 slice[low:high] 語法進行“切片”操作。例如，這裡得到一個包含元素 s[2], s[3],s[4] 的 slice。

這個 slice 從 s[0] 到（但是包含）s[5]

這個 slice 從（包含）s[2] 到 slice 的後一個值

我們可以在一行程式碼中聲明並初始化一個 slice 變數

Slice 可以組成多維數據結構。內部的 slice 長度可以嗎同，這和多位數組不同

##
注意，slice 和數組不同，雖然它們通過 fmt.Println 輸出差不多。