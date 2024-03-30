//
//  ListSectionData.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import Foundation
import SwiftUI

struct Show: Identifiable {
    var id = UUID()
    var poster: Image
}

struct ListSectionData: Identifiable {
    let name: String
    let image: Image
    var state: AccountState
    let isOwn: Bool
    let shows: [Show]
    let id = UUID()
    
    var modalWindow: ModalWindowAppearance {
        switch state {
        case .following:
            return ModalWindowAppearance(title: "Are you sure?",
                                         subtitle: "Once you unfollow, you will need to request to follow again.",
                                         primaryButtonText: "Yes, unfollow",
                                         secondaryButtonText: "No, go back")
        case .followBack:
            return ModalWindowAppearance(title: "Are you sure?",
                                         subtitle: "Once you remove a follower, they will need to request to follow again.",
                                         primaryButtonText: "Yes, remove",
                                         secondaryButtonText: "No, go back")
        case .deleteRoom:
            return ModalWindowAppearance(title: "Are you sure?",
                                               subtitle: "Deleting a room removes everyone from it.",
                                               primaryButtonText: "Yes, delete",
                                               secondaryButtonText: "No, go back")
        case .leaveRoom:
            return ModalWindowAppearance(title: "Are you sure?",
                                         subtitle: "Once you leave a room, you will need to request to join it again.",
                                         primaryButtonText: "Yes, leave",
                                         secondaryButtonText: "No, go back")
        }
    }
    
    static func getData() -> [ListSectionData] {
        [
            ListSectionData(name: "Room LAcrew",
                            image: Image("avatarPic1"),
                            state: .deleteRoom,
                            isOwn: true,
                            shows: [Show(poster: Image("poster1")),
                                    Show(poster: Image("poster2")),
                                    Show(poster: Image("poster3")),
                                    Show(poster: Image("poster4")),
                                    Show(poster: Image("poster5")),
                                    Show(poster: Image("poster6")),
                                   ]),
            
            ListSectionData(name: "Room NYgirls",
                            image: Image("avatarPic2"),
                            state: .leaveRoom,
                            isOwn: false,
                            shows: [Show(poster: Image("poster1")),
                                    Show(poster: Image("poster2")),
                                    Show(poster: Image("poster3")),
                                    Show(poster: Image("poster4")),
                                    Show(poster: Image("poster5")),
                                    Show(poster: Image("poster6")),
                                    Show(poster: Image("poster7")),
                                    Show(poster: Image("poster8")),
                                    Show(poster: Image("poster9")),
                                    Show(poster: Image("poster10"))
                                   ]),
            ListSectionData(name: "Kathryn Murphy",
                            image: Image("avatarPic3"),
                            state: .following,
                            isOwn: false,
                            shows: [Show(poster: Image("poster9")),
                                    Show(poster: Image("poster10"))
                                   ]),
            
            ListSectionData(name: "Dan Romer", image: Image("avatarPic4"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Alexander Pit", image: Image("avatarPic5"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Eleanor Pena", image: Image("avatarPic6"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Jeorge Mot", image: Image("avatarPic7"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Mark Steward", image: Image("avatarPic8"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Anna De Armas", image: Image("avatarPic9"), state: .followBack, isOwn: false, shows: []),
            ListSectionData(name: "Max Crod", image: Image("avatarPic"), state: .followBack, isOwn: false, shows: [])
        ]
    }
}


