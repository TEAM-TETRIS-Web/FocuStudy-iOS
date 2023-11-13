//
//  BackButton.swift
//  FocuStudy
//
//  Created by 최유경 on 11/13/23.
//

import Foundation
import SwiftUI

public struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    public var backButton : some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.gray80)
            }
        }
        
    }
    public var body : some View {
        Text("")
    }
}
