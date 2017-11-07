+++
author = "Theme author"
categories = ["Hugo"]
date = "2014-09-28"
description = "在编译期间被创建并确定值，运行期不能改变值"
featured = "pic03.jpg"
featuredalt = "Pic 3"
featuredpath = "date"
linktitle = ""
title = "常量 - (Constants) "
type = "post"

+++

## 常量  Constants

### 定义常量
通过const关键字，可以定义一个常量，语法如下
```go
const constantName [type]= value
```

<a href="http://play.golang.org/p/T5sj0eINnp"><img title="Run code" src="/img/code/play.png" class="run">在线抄写代码，运行，排查错误是高效学习Go的秘籍！ code run online.</a>
~~~go
package main

import "fmt"
import "math"

// `const` declares a constant value.
const s string = "constant"

func main() {
    fmt.Println(s)

    // A `const` statement can appear anywhere a `var`
    // statement can.
    const n = 500000000

    // Constant expressions perform arithmetic with
    // arbitrary precision.
    const d = 3e20 / n
    fmt.Println(d)

    // A numeric constant has no type until it's given
    // one, such as by an explicit cast.
    fmt.Println(int64(d))

    // A number can be given a type by using it in a
    // context that requires one, such as a variable
    // assignment or function call. For example, here
    // `math.Sin` expects a `float64`.
    fmt.Println(math.Sin(n))
}

~~~

Go的常量定义可以限定常量类型，但不是必需的。如果定义常量时没有指定类型，那么它是无类型常量。只要这个常量在相应类型的值域范围内，就可以作为该类型的常量，比如常量-12，它可以赋值给int、uint、int32、int64、float32、float64、complex64、complex128等类型的变量

示例:
```go
const Pi float64 = 3.14159265358979323846
const zero = 0.0 // 无类型浮点常量
const (
    size int64 = 1024
    eof = -1 // 无类型整型常量
)
const u, v float32 = 0, 3 // u = 0.0, v = 3.0，常量的多重赋值
const a, b, c = 3, 4, "foo" // a = 3, b = 4, c = "foo", 无          类型整型和字符串常量
```
常量定义的右值也可以是一个在编译期运算的常量表达式，比如 
const mask = 1 << 3 
由于常量的赋值是一个编译期行为，所以右值不能出现任何需要运行期才能得出结果的表达式，比如试图以如下方式定义常量就会导致编译错误：
```
const Home = os.GetEnv("HOME")
```
原因很简单，os.GetEnv()只有在运行期才能知道返回结果，在编译期并不能确定，所以 
无法作为常量定义的右值。

###  预定义常量
Go 语言预定义了这些常量：true、false 和 iota。 
iota 比较特殊，可以被认为是一个可被编译器修改的常量，它默认开始值是0，每调用一次加1。遇到 const 关键字时被重置为 0。

示例:

~~~go
const (       // iota被重设为0
    c0 = iota // c0 == 0
    c1 = iota // c1 == 1
    c2 = iota // c2 == 2
)

const (
    a = 1 << iota // a == 1 (iota在每个const开头被重设为0)
    b = 1 << iota // b == 2
    c = 1 << iota // c == 4
)

const (
    u = iota * 42         // u == 0
    v float64 = iota * 42 // v == 42.0
    w = iota * 42         // w == 84
)

const x = iota // x == 0 (因为iota又被重设为0了)
const y = iota // y == 0 (同上)
~~~

如果两个const的赋值语句的表达式是一样的，那么可以省略后一个赋值表达式。因此，上面的前两个const语句可简写为：
```go
const (       // iota被重设为0
    c0 = iota // c0 == 0
    c1        // c1 == 1
    c2        // c2 == 2
)
const (
    a = 1 <<iota // a == 1 (iota在每个const开头被重设为0)
    b            // b == 2
    c            // c == 4
)

### 枚举
枚举是指一系列相关的常量 。Go语言并不支持众多其他语言明确支持的enum关键字。在 const 后跟一对圆括号的方式定义一组常量，这种定义法在Go语言中通常用于定义枚举值。

比如关于一个星期中每天的定义,下面是一个常规的枚举表示法，其中定义了一系列整型常量：
~~~go
const (
    Sunday = iota
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday
    numberOfDays // 这个常量没有导出
)
~~~
```
