//
//  ProfileSection.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 29/03/24.
//

import SwiftUI

struct ProfileSection: View {
    var body: some View {
        HStack {
            
            ProfileAvatar().padding(EdgeInsets(top: 0, leading: 0, bottom: 14, trailing: 6))
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    Text("ShowchatCat")
                        .font(.custom("Montserrat-Semibold", size: 20))
                    
                    Spacer().frame(width: 20, height: 0)
                    
                    ProfileButton(action: {
                        print("Edit")
                    }, image: Image("profileEdit"))
                    
                    ProfileButton(action: {
                        print("More")
                    }, image: Image("profileMore"))
                }
                
                HStack(spacing: 24) {
                    ProfileStats(number: 1323, subtitle: "Showchats")
                    ProfileStats(number: 113, subtitle: "Followers")
                    ProfileStats(number: 59, subtitle: "Following")
                }
            }
        }
    }
}

#Preview {
    ProfileSection()
}
