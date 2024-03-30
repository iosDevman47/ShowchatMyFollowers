//
//  ContentView.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [ListSectionData] = ListSectionData.getData()
    
    @State var user: ListSectionData? /// Used to indicate whether to present modal view or remove
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ScrollView {
                ProfileSection()
                    .padding(.top)
                
                HStack() {
                    Text("MY FOLLOWERS")
                        .foregroundStyle(.white)
                        .font(.custom("Montserrat", size: 20))
                    Spacer()
                }.padding(EdgeInsets(top: 20, leading: 16, bottom: 12, trailing: 16))
                
                SearchBar()
                    .padding(.bottom, 8)
                
                ForEach($users) { $user in
                    ListSection(data: user) {
                        switch user.state {
                        case .followBack: return
                        default:
                            self.user = user
                        }
                    } deleteAction: { deleteUser in
                        self.user = deleteUser
                    }
                }
                
                /// Modal view
                .sheet(item: $user) { user in
                    ModalWindow(appearance: user.modalWindow) {
                        self.user = nil
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.users.removeAll(where: { $0.id == user.id })
                        }
                    } secondaryAction: {
                        self.user = nil
                    }
                    .presentationDetents([.fraction(0.45)])
                    .presentationDragIndicator(.visible)
                    .onDisappear {
                        self.user = nil
                    }
                }
            }
            .safeAreaInset(edge: .bottom, content: {
                Spacer().frame(width: nil, height: 100)
            })
            .background(Color("mainViewBackground"))
            .scrollIndicators(.never)
            
            MainButton(appearance: MainButtonModel(text: "Create a room",
                                                   textColor: Color("mainSectionButtonText"),
                                                   backgroundColor: AnyView(Gradients.mainButtonGradient)))
            {
                print("Create a room")
            }
        }
    }
}

#Preview {
    ContentView()
}

