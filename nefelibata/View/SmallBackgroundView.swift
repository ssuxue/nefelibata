//
//  SmallBackgroundView.swift
//  nefelibata
//
//  Created by hhhhh on 2020/12/24.
//

import SwiftUI

struct SmallBackgroundView: View {
    // 底部遮罩的占比为整体高度的 40%
    var contianerRatio : CGFloat = 0.4
    
    // 背景图片
    var backgroundImage : Image = Image("")
    
    // 从上到下的渐变颜色
    let gradientTopColor = Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
    let gradientBottomColor = Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    
    // 遮罩视图 简单封装 使代码更为直观
    func gradientView() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [gradientTopColor, gradientBottomColor]), startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        // 使用 GeometryReader 获取小组件的大小
        GeometryReader{ geo in
            // 使用 ZStack 叠放 logo 图标 和 底部遮罩
            ZStack{
                // 构建 logo 图标, 使用 frame 确定图标大小, 使用 position 定位图标位置
                Image("icon_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .position(x: geo.size.width - (20/2) - 10 , y : (20/2) + 10)
                    .ignoresSafeArea(.all)

                // 构建 遮罩视图, 使用 frame 确定遮罩大小, 使用 position 定位遮罩位置
                gradientView()
                    .frame(width: geo.size.width, height: geo.size.height * CGFloat(contianerRatio))
                    .position(x: geo.size.width / 2.0, y: geo.size.height * (1 - CGFloat(contianerRatio / 2.0)))
            }
            .frame(width: geo.size.width, height: geo.size.height)
            // 添加上覆盖底部的背景图片
            .background(backgroundImage
                            .resizable()
                            .scaledToFill()
            )
        }
    }
}

struct SmallBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SmallBackgroundView()
    }
}
