//
//  StartView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack{
                Text("집중하면서 공부하고 싶다면,")
                    .font(.semiBold)
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Text("FocuStudy")
                    .font(.extraBold)
                    .foregroundColor(.symbolBlue)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Text("Apple 로그인")
                    .font(.bold16)
                    .foregroundColor(.white)
                    .padding(.vertical,9)
                Spacer()
            }
            .background(Color.black)
            .cornerRadius(12)
            .padding(.bottom,100)
            .padding(.horizontal,20)
            Spacer()
            
        }.padding(.horizontal,40)
            .padding(.vertical,10)
        
    }
}


