//
//  SearchBar.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            Button(action:{
                print("Search")
            }, label: {
                Image("searchSearch")
            })
            .frame(width: 40, height: 40)
            .background(Color("searchBackground"))
            .clipShape(Circle())
            
            Spacer()
            
            Button(action:{
                print("Search")
            }, label: {
                Image("searchRemove")
            })
            .frame(width: 40, height: 40)
            .background(.clear)
            .clipShape(Circle())
        }
        .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
        .background(Color("searchbarBackground"))
    }
}

#Preview {
    SearchBar()
}
