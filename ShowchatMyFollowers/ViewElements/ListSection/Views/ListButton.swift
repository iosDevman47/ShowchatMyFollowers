//
//  ListButton.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

enum AccountState {
    case following
    case followBack
    case deleteRoom
    case leaveRoom
}

struct ListButton: View {
    
    @State var currentState: AccountState
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText(state: currentState))
                .font(.custom("Montserrat-Medium", size: 14))
        })
        .frame(width: 116, height: 40)
        .foregroundStyle(textColor(state: currentState))
        .background(backgroundColor(state: currentState))
        .overlay {
            borderColor(state: currentState)
        }
        .clipShape(Capsule())
        
    }
        
    private func buttonText(state: AccountState) -> String {
        switch state {
        case .following:
            return "Following"
        case .followBack:
            return "Follow back"
        case .deleteRoom:
            return "Delete room"
        case .leaveRoom:
            return "Leave room"
        }
    }
    
    private func textColor(state: AccountState) -> Color {
        switch state {
        case .following, .leaveRoom, .deleteRoom:
            return Color("listButtonText")
        case .followBack:
            return Color("listButtonTextColor")
        }
    }
    
    private func backgroundColor(state: AccountState) -> AnyView {
        switch state {
        case .following, .deleteRoom, .leaveRoom:
            return AnyView(Gradients.listButtonBackgroundGradient)
        case .followBack:
            return AnyView(Color("mainViewBackground"))
        }
    }
    
    private func borderColor(state: AccountState) -> AnyView {
        switch state {
        case .following, .deleteRoom, .leaveRoom:
            return AnyView(Capsule().stroke(Color("listButtonBorder"), lineWidth: 2))
        case .followBack:
            return AnyView(Capsule().stroke(Gradients.listButtonBorderGradient, lineWidth: 2))
        }
    }
}

#Preview {
    ListButton(currentState: AccountState.followBack, action: {})
}
