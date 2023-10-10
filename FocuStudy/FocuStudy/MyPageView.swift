//
//  MyPageView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/10/03.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("09월 30일 (토)")
                        .font(.bold16)
                        .padding()
                    Spacer()
                }
                .padding(.horizontal,20)
                
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle().inset(by: 20))
                    .padding(.horizontal,70)
                
                Text("StopYoon님")
                    .font(.bold24)
                    .padding(.bottom,30)
    
                VStack(spacing:35){
                    HStack(spacing:40){
                        VStack{
                            Text("총 공부시간")
                                .font(.semiBold)
                                .foregroundColor(.symbolBlue)
                            
                            Text("10:24:10")
                                .font(.semiBold)
                        }
                        VStack{
                            Text("최대 집중 시간")
                                .font(.semiBold)
                                .foregroundColor(.symbolBlue)
                            
                            Text("8:12:30")
                                .font(.semiBold)
                        }
                    }
                    HStack(spacing:40){
                        VStack{
                            Text("시작시간")
                                .font(.semiBold)
                                .foregroundColor(.symbolBlue)
                            
                            Text("07시 46분")
                                .font(.semiBold)
                        }
                        
                        VStack{
                            Text("종료시간")
                                .font(.semiBold)
                                .foregroundColor(.symbolBlue)
                            
                            Text("21시 35분")
                                .font(.semiBold)
                        }
                    }
                }
                Spacer()
            }
            
                .navigationTitle("My Page")
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination: SettingView(),
                            label: {
                                Image(systemName: "slider.horizontal.3")
                                
                            })
                )
        }
    }
}
struct SettingView: View {
    @State var nickName: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack{
            Spacer()
            Spacer()
            HStack{
                Text("닉네임 수정")
                    .font(.bold16)
                Spacer()
            }
            TextField("Enter your nickName", text: $nickName)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                        
            Spacer()

            HStack{
                Spacer()
                Text("완료")
                    .font(.bold16)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical,10)
            .background(Color.symbolBlue)
            .cornerRadius(12)
            
            Spacer()

        }
        .padding(.horizontal,20)
        

    }
}
#Preview {
    MyPageView()
}
