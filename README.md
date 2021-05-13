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

---删了---
写于2020年12月19日凌晨1点32分。
