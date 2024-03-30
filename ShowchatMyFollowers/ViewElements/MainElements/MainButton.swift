//
//  MainButton.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct MainButtonModel {
    var text: String
    var textColor: Color
    var backgroundColor: AnyView
}

struct MainButton: View {
    
    @State var appearance: MainButtonModel
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(appearance.text)
                .frame(maxWidth: .infinity, minHeight: 64)
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundStyle(appearance.textColor)
                .background(appearance.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 13))
        })
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    let data = MainButtonModel(text: "Create a room", textColor: Color("mainSectionButtonText"), backgroundColor: AnyView(Gradients.mainButtonGradient))
    
    return MainButton(appearance: data) {
        print("Tapped!")
    }
}
