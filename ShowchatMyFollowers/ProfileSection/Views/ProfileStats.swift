//
//  ProfileStats.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 29/03/24.
//

import SwiftUI

struct ProfileStats: View {
    
    var number: Int
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(number))
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundStyle(Color("profileStatNumber"))
            Text(subtitle)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundStyle(Color("profileStatSubtitle"))
        }
    }
}

#Preview {
    ProfileStats(number: 1323, subtitle: "Showchats")
}
