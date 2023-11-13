//
//  NickNameView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/23.
//

import SwiftUI

struct NickNameView: View {
    @State var nickName: String = ""

    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack(spacing : 0){
                Text("닉네임")
                    .font(.semiBold)
                    .foregroundColor(.symbolBlue)
                Text("을 설정해주세요.")
                    .font(.semiBold)
                    .foregroundColor(.black)
                Spacer()
            }
            TextField("Enter your nickname", text: $nickName)
              .padding()
              .background(Color(uiColor: .secondarySystemBackground))
            

            Spacer()
            HStack{
                Spacer()
                Text("\(nickName)(으)로 시작하기")
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

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView()
    }
}
