//
//  DrawerLayout.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI

struct DrawerLayout: View {
    @State var dark = false
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { _ in
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                withAnimation(.default) {
                                    self.show.toggle()
                                }
                            }) {
                                Image("avatar")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                            
                            VStack(spacing: 4.0) {
                                Text("池映月")
                                Text("手机在线 - WiFi")
                                    .font(.caption)
                            }
                            
                            Spacer()
                        }
                        
                        Text("主页")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    
                    Spacer()
                    
                    Text("消息内容")
                    
                    Spacer()
                }
            }
            
            HStack {
                Menu(dark: self.$dark, show: self.$show)
                    .preferredColorScheme(self.dark ? .dark : .light)
                    .offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.5)
                
                Spacer(minLength: 0)
            }
            .background(Color.primary.opacity(self.show ? (self.dark ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
        }
    }
}

struct DrawerLayout_Previews: PreviewProvider {
    static var previews: some View {
        DrawerLayout()
    }
}

struct Menu: View {
    @Binding var dark: Bool
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.default) {
                        self.show.toggle()
                    }
                }) {
                  Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12, height: 20)
                }
                
                Spacer()
                
                Button(action: {}) {
                  Image(systemName: "square.and.pencil")
                    .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            Image("avatar")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            VStack(spacing: 12) {
                Text("池映月")
                Text("插画师")
                    .font(.caption)
            }
            .padding(.top, 25)
            
            HStack(spacing: 22) {
                Image(systemName: "moon.fill")
                    .font(.title)
                
                Text("深色模式")
                
                Spacer()
                
                Button(action: {
                    self.dark.toggle()
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                }) {
                    Image("off")
                        .font(.title)
                        .rotationEffect(.init(degrees: self.dark ? 180 : 0))
                }
            }
            .padding(.top, 25)
            
            Group {
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("qq")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                        
                        Text("我的收藏")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("wechat")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.pink)
                        
                        Text("我的相册")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Divider()
                    .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("wechat")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                        
                        Text("支付")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("qq")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                        
                        Text("卡包")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("qq")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                        
                        Text("表情")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Divider()
                    .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image("qq")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                        
                        Text("设置")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
            }
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((self.dark ? Color.black : Color.white).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
        
    }
}
