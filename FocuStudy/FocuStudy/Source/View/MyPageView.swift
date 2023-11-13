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
            ZStack{
                //BackGroundView()
                VStack{
                    HStack{
                        Text("09월 30일 (토)")
                            .font(.bold16)
                            .padding()
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    VStack(spacing:0){
                        Image("profile")
                            .resizable()
                            .frame(width: 200)
                            .scaledToFit()
                            .clipShape(Circle().inset(by: 20))
                            .padding(.horizontal,70)
                        
                        Text("StopYoon님")
                            .font(.bold16)
                            .padding(.bottom,30)
                    }
                    HStack{
                        HStack{
                            VStack{
                                Text("총 공부시간")
                                    .font(.bold16)
                                    .foregroundColor(.symbolBlue)
                                
                                Text("10:24:10")
                                    .font(.bold16)
                            }
                            .padding(.all,6)
                            .background(Color.white)
                            .cornerRadius(12)
                            
                            VStack{
                                Text("최대 집중 시간")
                                    .font(.bold16)
                                    .foregroundColor(.symbolBlue)
                                
                                Text("8:12:30")
                                    .font(.bold16)
                            }
                            .padding(.all,6)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                        HStack{
                            VStack{
                                Text("시작시간")
                                    .font(.bold16)
                                    .foregroundColor(.symbolBlue)
                                
                                Text("07시 46분")
                                    .font(.bold16)
                            }
                            .padding(.all,6)
                            .background(Color.white)
                            .cornerRadius(12)
                            
                            VStack{
                                Text("종료시간")
                                    .font(.bold16)
                                    .foregroundColor(.symbolBlue)
                                
                                Text("21시 35분")
                                    .font(.bold16)
                            }
                            .padding(.all,6)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                    }
                    Spacer()
                    
                    VStack{
                        HStack{
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                        }
                        HStack{
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                        }
                        HStack{
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                        }
                        HStack{
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                            coinView()
                        }
                    }
                    .background(Color.gray10)
                    Spacer()
                    
                    VStack{
                        HStack(spacing:0){
                            Text("보유 코인 : ")
                                .font(.bold16)
                            Text("24")
                                .font(.bold16)
                                .foregroundColor(Color.symbolBlue)
                            Text("개")
                                .font(.bold16)
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
            }.background(Color.systemGray)
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

struct coinView: View {
    var body: some View {
        
        VStack{
            
            Image("coin")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding(.all,1)
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    MyPageView()
}
