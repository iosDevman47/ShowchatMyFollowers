//
//  ProfileAvatar.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 29/03/24.
//

import SwiftUI

struct ProfileAvatar: View {
    var body: some View {
        Image("avatarImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.orange, lineWidth: 0.63)
            }
            .frame(width: 80, height: 80, alignment: .center)
    }
}

#Preview {
    ProfileAvatar()
}
