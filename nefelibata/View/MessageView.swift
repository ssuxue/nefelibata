//
//  MessageView.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageView: View {
    @ObservedObject var viewModel = MessageMemory()
    @Binding var dark: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.messages) { msg in
                    ZStack {
                        // Adding Buttons.
                        HStack {
                            Color.yellow
                                .frame(width: 90)
                                // Hiding when left swipe.
                                .opacity(msg.offset > 0 ? 1 : 0)
                            Spacer()
                            
                            Color.red
                                .frame(width: 90)
                                .opacity(msg.offset < 0 ? 1 : 0)
                        }
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "pin.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 90)
                            
                            Spacer()
                            
                            Button(action: {
                                // Removing from message view.
                                viewModel.messages.removeAll { (msg1) -> Bool in
                                    if msg.avatar == msg1.avatar {
                                        return true
                                    } else {
                                        return false
                                    }
                                }
                            }) {
                                Image(systemName: "trash.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 90)
                        }
                        
                        HStack(spacing: 15) {
                            WebImage(url: URL(string: msg.avatar))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 10.0) {
                                Text(msg.name)
                                
                                Text(msg.message)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                
                                Divider()
                            }
                        }
                        .padding(.all)
                        .background(self.dark ? Color.black : Color.white)
                        .contentShape(Rectangle())
                        // Adding Gesture.
                        .offset(x: msg.offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            viewModel.messages[getIndex(profile: msg.avatar)].offset = value.translation.width
                        })
                        .onEnded({ (value) in
                            if value.translation.width > 80 {
                                viewModel.messages[getIndex(profile: msg.avatar)].offset = 90
                            } else if value.translation.width < -80 {
                                viewModel.messages[getIndex(profile: msg.avatar)].offset = -90
                            } else {
                                viewModel.messages[getIndex(profile: msg.avatar)].offset = 0
                            }
                        }))
                    }
                }
            }
        }
        .animation(.default)
    }
    
    func getIndex(profile: String) -> Int {
        var index = 0
        
        for i in 0..<viewModel.messages.count {
            if profile == viewModel.messages[i].avatar {
                index = i
            }
        }
        
        return index
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(dark: .constant(true))
    }
}
