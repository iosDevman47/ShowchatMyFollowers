//
//  ListAvatar.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct ListAvatar: View {
    
    var avatarImage: Image
    
    var body: some View {
        avatarImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color("listAvatarBorder"), lineWidth: 1)
            }
            .frame(width: 48, height: 48, alignment: .center)
    }
}

#Preview {
    ListAvatar(avatarImage: Image("avatarImage"))
}
