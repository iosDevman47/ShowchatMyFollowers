//
//  ListSection.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct ListSection: View {
    
    @State var data: ListSectionData
    @State var isExpanded: Bool = false
    @State var offset = 0.0
    @GestureState var isSwiping = false
    
    var action: () -> Void
    var deleteAction: (ListSectionData) -> Void
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            
            Button {
                deleteAction(data)
            } label: {
                Image("delete")
                    .frame(width: 24, height: 24)
            }
            .padding(.trailing, 20)
            
            VStack {
                HStack() {
                    ListAvatar(avatarImage: data.image)
                        .padding(.leading, 14)
                    
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .foregroundStyle(.white)
                            .font(.custom("Montserrat-Semibold", size: 16))
                        Button(action: {
                            withAnimation(.spring(duration: 0.3)) {
                                isExpanded.toggle()
                            }
                        }, label: {
                            Text(isExpanded ? "Hide watched shows" : "Show watched shows")
                                .font(.custom("Montserrat-Medium", size: 12))
                                .foregroundStyle(Color("listSubtitle"))
                        })
                    }
                    
                    Spacer()
                    
                    ListButton(currentState: data.state) {
                        action()
                    }
                    
                    Spacer().frame(width: 20)
                }
                .frame(maxWidth: .infinity)
                
                if isExpanded {
                    ListShows(shows: data.shows)
                }
            }
            .background(Color("mainViewBackground"))
            .offset(x: offset)
            .gesture(DragGesture()
                .updating($isSwiping, body: { value, state, _ in
                    state = true
                    onChanged(value: value)
                })
                    .onEnded({ value in
                        onEnd(value: value)
                    }))
        }
        
    }
    
    private func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 && isSwiping {
            offset = value.translation.width
        }
    }
    
    private func onEnd(value: DragGesture.Value) {
        withAnimation {
            if -value.translation.width >= 30 {
                offset = -65
            } else {
                offset = 0
            }
        }
    }
}

#Preview {
    @State var data = ListSectionData(name: "RoomNYgirls",
                                      image: Image("avatarImage"),
                                      state: .followBack,
                                      isOwn: false,
                                      shows: [Show(poster: Image("poster1")),
                                              Show(poster: Image("poster2")),
                                              Show(poster: Image("poster3")),
                                              Show(poster: Image("poster4")),
                                              Show(poster: Image("poster5")),
                                              Show(poster: Image("poster6")),
                                             ])
    return ListSection(data: data, action: {}, deleteAction: {_ in })
}
