//
//  SettingView.swift
//  FocuStudy
//
//  Created by 최유경 on 11/13/23.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @State var nickName: String = ""
    @Environment(\.presentationMode) var presentationMode
    
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
    var body: some View {
        
        VStack{
            Spacer()
            Spacer()
            HStack{
                Text("닉네임 수정")
                    .font(.bold16)
                Spacer()
            }
            TextField("", text: $nickName)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            
            Spacer()
            
            HStack{
                Spacer()
                Text("완료")
                    .font(.bold16)
                    .foregroundColor(.gray80)
                Spacer()
            }
            .padding(.vertical,10)
            .background(Color.white)
            .cornerRadius(12)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
            
        }
        .padding(.horizontal,20)
        .background(Color.systemGray)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
    }
}
