//
//  Gradients.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import Foundation
import SwiftUI

struct Gradients {
    
    static let mainButtonGradient: LinearGradient = LinearGradient(colors: [Color("mainButtonBackgroundGradient1"),
                                                                            Color("mainButtonBackgroundGradient2"),
                                                                            Color("mainButtonBackgroundGradient2")
                                                                           ],
                                                                   startPoint: .top,
                                                                   endPoint: .bottomLeading)
    
    static let listButtonBorderGradient: LinearGradient = LinearGradient(colors: [Color("listButtonBorderGradient1"),
                                                                                  Color("listButtonBorderGradient2"),
                                                                                  Color("listButtonBorderGradient3")
                                                                                 ],
                                                                         startPoint: .topTrailing,
                                                                         endPoint: .bottomLeading)
    
    static let listButtonBackgroundGradient: LinearGradient = LinearGradient(colors: [Color("listButtonBackgroundGradient1"),
                                                                                      Color("listButtonBackgroundGradient2")],
                                                                             startPoint: .leading,
                                                                             endPoint: .trailing)
    
    static let profileButtonGradient: LinearGradient = LinearGradient(colors: [Color("profileButtonGradient1"),
                                                                               Color("profileButtonGradient2")],
                                                                      startPoint: .topLeading,
                                                                      endPoint: .bottomTrailing)
}
