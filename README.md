# SwiftUI学习记录
> 人是不能太闲的，闲久了，努力一下就以为是拼命。

1. Grid
2. GeometryReader

  `GeometryReader` 能够获取父 view 建议的尺寸
  
3. @ViewBuilder

  用于从闭包构造视图，通常将其用作产生子视图的闭合参数的参数属性，从而允许这些闭合提供多个子视图。例如，以下函数接受通过视图构建器生成一个或多个视图的闭包。也可以在闭包子视图函数外使用。可以用这个返回空视图。
  例如：
  ```swift
  struct Passthrough<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
    }

  }
  ```
  使用；
  ```swift
  Passthrough {
    Text("one")
    Text("two")
    Text("three")
  }
  ```
4. Shape
SwiftUI 启用具有两种不同类型的自定义绘图：路径和形状。
SwiftUI使用一个必需的方法将Shape作为协议实现。
```swift
struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * cos(CGFloat(endAngle.radians))
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}
```
5. ViewModifier
在 View 上添加修饰图。
![image](https://chase-oss2.oss-cn-beijing.aliyuncs.com/images/2021-02-06-2.55.58.png)

![image](https://chase-oss2.oss-cn-beijing.aliyuncs.com/images/2021-02-06-2.57.06.png)

![image](https://chase-oss2.oss-cn-beijing.aliyuncs.com/images/2021-02-06-2.57.19.png)

> 大学几年学习感言

大一大二的时候，我电脑配置不好学不了移动开发，不然以我四年专注于一个方向上，我现在也不会这么紧张，因为还有不到半年就要实习了。

电脑配置不好，我一开始学的 Go 做微服务，然后没学太深就跑去学 Python，然后一直学到了深度学习，但是我发现我真的数学不太好，我又跑回去搞 Java。

Java 可以说是当时我学的最久的了，但是大三上过了一半时间我就有点犹豫了，因为学 Java 的人太多了，最主要的是我买新电脑了。然后原生安卓我不打算进阶。

我挺喜欢用 Java 做微服务的，但是我还是想走最开始的那条路。引领我走向开发的那条道路--Go + Flutter，然后再会点 SwiftUI，这真是我喜欢的方式了。

其实大一我就先学 Go 仅仅是因为字节跳动用的 Go 开发，Flutter 也是，但是现在我深知自己没有机会了。

我现在就想实习的时候找个 Go 岗位或者 IOS 岗位，然后哔哩哔哩也是用 Go 开发的，我就主要想去这里。加油！

写于2020年12月19日凌晨1点32分。
