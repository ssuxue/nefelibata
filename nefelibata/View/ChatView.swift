//
//  ChatView.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI

struct ChatView: View {
    @State var voiceClicked = false
    @State var expressionClicked = false
    @State var otherFuncClicked = false
    @State var showSheet = false
    
    @Binding var message: String
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                HStack {
                    Image(systemName: "chevron.left")
                      .resizable()
                      .frame(width: 12, height: 20)
                    
                    Spacer()
                    
                    Text("谢道韫")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
                        Image(systemName: "phone")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                    }
                        
                    
                    Image(systemName: "square.grid.2x2")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                ScrollViewReader { reader in
                    ScrollView {
                        VStack(spacing: 15) {
                            // TODO: 遍历消息气泡
                            ForEach(0..<5) { index in
                                Text("有没有推荐的恐怖电影？")
                            }
                        }
                        .padding(.vertical)
                    }
                }
                
                HStack(spacing: 10) {
                    Button(action: {
                        voiceClicked.toggle()
                    }) {
                        Image("voice")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 40, height: 40)
                            .foregroundColor(voiceClicked ? .blue : .black)
                    }
                    
                    TextField("", text: self.$message)
                        .padding()
                        .frame(height: 45)
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                    Button(action: {
                        expressionClicked.toggle()
                    }) {
                        Image(expressionClicked ? "expression" : "smile")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                    if self.message != "" {
                        Button(action: {}) {
                            Text("发送")
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                                .frame(width: 55, height: 40)
                                .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                                .cornerRadius(10)
                        }
                    } else {
                        Button(action: {
                            otherFuncClicked.toggle()
                        }) {
                            Image(systemName: otherFuncClicked ? "plus.circle.fill" : "plus.circle")
                                .resizable()
                                .frame(width: 37, height: 37)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                .animation(.easeIn)
                
            }
            .background(Color.primary.opacity(0.06))
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                Spacer()
                
                PhoneActionSheet()
                    .offset(y: self.showSheet ? 0 : screen.height)
            }
            .background((self.showSheet ? Color.black.opacity(0.3) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.showSheet.toggle()
                            })
            .animation(.default)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(message: .constant(""))
    }
}

struct PhoneActionSheet: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("您可以选择以下通话操作")
                .font(.system(size: 15))
                .foregroundColor(Color.black.opacity(0.68))
            
            Divider()
            
            Button(action: {}) {
                Text("语音通话")
                    .foregroundColor(.black)
            }
            
            Divider()
            
            Button(action: {}) {
                Text("视频通话")
                    .foregroundColor(.black)
            }
            
            Divider()
            
            Button(action: {}) {
                Text("取消")
                    .foregroundColor(.black)
            }
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .cornerRadius(25)
    }
}
