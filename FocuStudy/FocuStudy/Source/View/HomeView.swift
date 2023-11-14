//
//  HomeView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/10/12.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @State private var myGroup = 0
    let myGroups = ["토익 990점 뿌시기", "백준 골드1 도전방", "전공시험 스터디 구합니다", "책벌레"]
    
    @State static var myStudyTime = 9000
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    VStack(spacing:3){
                        
                        Text("11월 02일 (목)")
                            .font(.bold16)
                            .foregroundColor(.black)
                            .padding(.bottom,40)
                        
                        
                        Text("Focus TIME")
                            .font(.semiBold)
                            .foregroundColor(.black)
                        
                        
                        Text(convertSecondsToTime(timeInSeconds: HomeView.myStudyTime+5))
                            .font(.extraBold)
                            .foregroundColor(.black)
                        
                        
                        
                        
                    }
                    .padding(.vertical,60)
                    .padding(.horizontal,60)
                    .cornerRadius(18)
                    Spacer()
                }.padding(.horizontal,10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal,20)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Picker("My Group", selection: $myGroup) {
                        ForEach(myGroups, id:\.self) {
                            Text("\($0)")
                        }
                        
                        .padding(.horizontal,30)
                        .padding(.vertical,80)
                        .background(Color.white)
                        
                        .pickerStyle(.navigationLink)
                    }
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal,20)
                
                Spacer()
                
                NavigationLink(
                    destination: studyView(myStudyTime: HomeView.$myStudyTime),
                    label: {
                        HStack{
                            Spacer()
                            Text("공부 시작하기")
                                .font(.bold16)
                                .foregroundColor(.black)
                                .padding(.vertical,15)
                            Spacer()
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal,20)
                    })
                Spacer()
            }
            .navigationTitle("Home")
            .background(Color.systemGray)
            
        }
        
    }
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds - hours*3600) / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
}

#Preview {
    HomeView()
}
