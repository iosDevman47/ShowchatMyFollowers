//
//  ProfileButton.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 29/03/24.
//

import SwiftUI

struct ProfileButton: View {
    
    var action: () -> Void
    var image: Image
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            image
                .frame(width: 40, height: 40)
                .background(Gradients.profileButtonGradient)
                .clipShape(Circle())
        })
    }
}

#Preview {
    ProfileButton(action: {
        print("Tapped")
    }, image: Image("profileEdit"))
}
