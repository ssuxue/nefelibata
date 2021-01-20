//
//  SmallView.swift
//  nefelibata
//
//  Created by hhhhh on 2020/12/24.
//

import SwiftUI

struct SmallView : View {
    
    // 设置大图标的宽高为小组件高度的 40%
    func bigIconWidgetHeight(viewHeight:CGFloat) -> CGFloat {
        return viewHeight * 0.4
    }
    
    var body: some View {
        
        GeometryReader{ geo in
            VStack(alignment: .center, spacing : 2){
                Image("iconImageName")
                    .resizable()
                    .scaledToFill()
                    .frame(width: bigIconWidgetHeight(viewHeight: geo.size.height), height: bigIconWidgetHeight(viewHeight: geo.size.height))
                
                Text("每日推荐")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .frame(height: 21)
                
                Text("为你带来每日惊喜")
                    .foregroundColor(.white)
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                    .opacity(0.8)
                    .lineLimit(1)
                    .frame(height: 18)
            }
            // 增加 padding 使 Text 过长时不会触及小组件边框
            .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            // 设置背景视图
            .background(SmallBackgroundView())
        }
    }
}



struct SmallView_Previews: PreviewProvider {
    static var previews: some View {
        SmallView()
    }
}
