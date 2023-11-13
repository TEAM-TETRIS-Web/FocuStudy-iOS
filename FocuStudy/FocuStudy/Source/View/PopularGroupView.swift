//
//  PopularGroupView.swift
//  FocuStudy
//
//  Created by 최유경 on 11/13/23.
//

import Foundation
import SwiftUI

struct popularGroupView: View {
    var popular : [Group] = [
        Group(groupName: "토익 900점 뿌시기",groupDetail: "토익 900점을 목표로 하는 방입니다. 대학생, 취준생 모두 가능합니다. 열심히 하실분만 들어와주세요" , groupPersonnel: "37/60",groupImage: "english", currentStudy: "21", groupcolor: Color(red: 0.64, green: 0.46, blue: 0.93).opacity(0.87)),
        
        Group(groupName: "Swift 마스터",groupDetail: "취업난에서 살아남기! 네카라쿠배 뿌시자!!" , groupPersonnel: "13/30",groupImage: "apple", currentStudy: "9", groupcolor: Color(red: 0.45, green: 0.66, blue: 0.43).opacity(0.87))
    ]
    @State var isButtonTapped = false

    var body: some View {
        
        VStack{
            HStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(popular) { group in
                            HStack{
                                VStack{
                                    HStack{
                                        Text(group.groupName)
                                            .font(.semiBold)
                                        Spacer()
                                        Image(group.groupImage)
                                            .resizable()
                                            .frame(width: 30,height: 30)
                                            .clipped()
                                    }
                                    HStack{
                                        Text(group.groupDetail)
                                            .frame(width: 200)
                                        Spacer()
                                    }
                                    .padding(.bottom,5)
                                    
                                    HStack{
                                        VStack(spacing:0){
                                            HStack(spacing:0){
                                                Text(group.currentStudy)
                                                Text("명 공부중")
                                                Spacer()
                                            }
                                            HStack{
                                                Text(group.groupPersonnel)
                                                    .font(.medium16)
                                                Spacer()
                                                
                                                Button(action: {
                                                    isButtonTapped = true

                                                }) {
                                                    HStack {
                                                        Text("참여하기")
                                                            .padding(.all,6)
                                                            .background(Color.white)
                                                            .foregroundColor(Color.gray80)
                                                            .cornerRadius(10)
                                                    }
                                                }
                                                .alert(isPresented: $isButtonTapped){
                                                    Alert(title: Text("참여가 완료되었습니다"), message: nil,
                                                            dismissButton: .default(Text("확인")))
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.all,20)
                            .background(AngularGradient(gradient: Gradient(colors: [Color.gray20, group.groupcolor]),
                                                        center: .topLeading,
                                                        angle: .degrees(180 + 45))
                            )
                            .cornerRadius(20)
                            
                        }
                        .cornerRadius(20)
                        .shadow(color: Color.gray20.opacity(0.3), radius: 6, x: 0, y: 3)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom:0, trailing: 20))
                    }
                }
            }
        }
    }
}
