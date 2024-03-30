//
//  ListShows.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct ListShows: View {
    
    var shows: [Show]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if !shows.isEmpty {
                    ForEach(shows) { show in
                        show.poster
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 66, height: 104)
                    }
                    .padding(.trailing, 12)
                } else {
                    Text("No watched shows")
                        .foregroundStyle(.white)
                        .font(.custom("Montserrat-Medium", size: 14))
                }
            }
            .padding(.leading, 18)
        }
        .frame(height: 104)
        .safeAreaInset(edge: .trailing) {
            Spacer().frame(width: 20, height: nil)
        }
    }
}

#Preview {
    ListShows(shows: [Show(poster: Image("poster1")),
                      Show(poster: Image("poster2")),
                      Show(poster: Image("poster3")),
                      Show(poster: Image("poster4")),
                      Show(poster: Image("poster5")),
                      Show(poster: Image("poster6")),
                     ])
}
