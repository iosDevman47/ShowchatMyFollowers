//
//  ModalWindow.swift
//  ShowchatMyFollowers
//
//  Created by Alex Nasulloev on 30/03/24.
//

import SwiftUI

struct ModalWindowAppearance {
    let title: String
    let subtitle: String
    let primaryButtonText: String
    let secondaryButtonText: String
}

struct ModalWindow: View {
    
    let appearance: ModalWindowAppearance
    let mainAction: () -> Void
    let secondaryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(appearance.title)
                .foregroundStyle(.white)
                .font(.custom("Montserrat-Bold", size: 32))
                .padding(.bottom, 10)
            
            Text(appearance.subtitle)
                .frame(width: 300)
                .lineSpacing(4)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .font(.custom("Montserrat-Regular", size: 16))
                .padding(.bottom)
            
            MainButton(appearance: MainButtonModel(text: appearance.primaryButtonText,
                                                   textColor: Color("mainSectionButtonText"),
                                                   backgroundColor: AnyView(Gradients.mainButtonGradient))) 
            {
                mainAction()
            }
            .padding(.bottom, 12)
            
            MainButton(appearance: MainButtonModel(text: appearance.secondaryButtonText,
                                                   textColor: Color(.white),
                                                   backgroundColor: AnyView(Gradients.listButtonBackgroundGradient))) 
            {
                secondaryAction()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bottomSheetBackground"))
    }
}

#Preview {
    
    let data = ModalWindowAppearance(title: "Are you sure?",
                                     subtitle: "Deleting a room removes everyone from it.",
                                     primaryButtonText: "Yes, delete",
                                     secondaryButtonText: "No, go back")
    
    return ModalWindow(appearance: data) {
        print("Main")
    } secondaryAction: {
        print("Second")
    }

}
