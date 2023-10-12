//
//  HomeView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/10/12.
//

import SwiftUI

struct HomeView: View {
    @State private var myGroup = 0
    let myGroups = ["토익 990점 맞기", "백준 골드1 도전방", "전공시험 스터디 구합니다", "같이 코딩하실분"]
    
    var body: some View {
        NavigationView{
            VStack{
                Text("11월 02일 (목)")
                    .font(.bold16)
                    .foregroundColor(.symbolBlue)
                VStack(spacing:3){
                    Text("Focus TIME")
                        .font(.semiBold)
                        .foregroundColor(.symbolBlue)
                    
                    Text("02:10:35")
                        .font(.extraBold)
                        .foregroundColor(.symbolBlue)
                }
                .padding(.vertical,50)
                .padding(.horizontal,70)
                .background(Color.lightBlue)
                .cornerRadius(18)
                
                Spacer()
                
                Section{
                    Picker("My Group", selection: $myGroup) {
                        ForEach(myGroups, id:\.self) {
                            Text("\($0)")
                        }
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical,20)
                    .background(Color.gray10)
                    
                    .pickerStyle(.navigationLink)
                    
                    Spacer()
        
                    NavigationLink(
                        destination: studyView(),
                        label: {
                            HStack{
                                Text("공부 시작하기")
                                    .font(.bold16)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal,30)
                            .padding(.vertical,15)
                            .background(Color.symbolBlue)
                            .cornerRadius(20)
                        })
                }
                .navigationTitle("Home")
                Spacer()
            }
            
        }
    }
    
    
}
struct studyView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        VStack{
                            Image("profile")
                            Text("정지윤")
                                .font(.bold16)
                                .foregroundColor(.symbolBlue)
                            Text("02:10:46")
                                .font(.bold24)
                                .foregroundColor(.symbolBlue)
                            
                        }
                        VStack{
                            Image("profile")
                            Text("박상규")
                                .font(.bold16)
                                .foregroundColor(.symbolBlue)
                            Text("01:34:10")
                                .font(.bold24)
                                .foregroundColor(.symbolBlue)
                        }
                        VStack{
                            Image("profile")
                            Text("양민서")
                                .font(.bold16)
                                .foregroundColor(.symbolBlue)
                            Text("03:51:32")
                                .font(.bold24)
                                .foregroundColor(.symbolBlue)
                        }
                        VStack{
                            Image("profile")
                            Text("황기중")
                                .font(.bold16)
                                .foregroundColor(.symbolBlue)
                            Text("00:45:39")
                                .font(.bold24)
                                .foregroundColor(.symbolBlue)
                        }
                        
                    }
                    .padding()
                }
                Spacer()
                
                HStack{
                    Image("profile")
                    
                    VStack(spacing:8){
                        Text("Focus TIME")
                            .font(.bold16)
                            .foregroundColor(.symbolBlue)
                        
                        Text("02:10:35")
                            .font(.bold24)
                            .foregroundColor(.symbolBlue)
                    }
                }
                .padding(.vertical,20)
                .padding(.horizontal,30)
                .background(Color.lightBlue)
                .cornerRadius(18)
                .padding(.bottom,30)
            
                HStack{
                    Text("공부 그만하기")
                        .font(.bold16)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,30)
                .padding(.vertical,15)
                .background(Color.symbolBlue)
                .cornerRadius(20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()

                }
                
                Spacer()
            }
            .navigationTitle("토익 990점 맞기")
        }
    }
}
