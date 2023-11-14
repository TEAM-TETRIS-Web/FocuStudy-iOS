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
                    VStack(spacing:3){
                        HStack{
                            Text("11월 02일 (목)")
                                .font(.bold16)
                                .foregroundColor(.black)
                                .padding(.bottom,20)
                                .padding(.top,10)
                            
                            Spacer()
                        }
                        
                        Text("Focus TIME")
                            .font(.semiBold)
                            .foregroundColor(.black)
                        
                        
                        Text(convertSecondsToTime(timeInSeconds: HomeView.myStudyTime+5))
                            .font(.extraBold)
                            .foregroundColor(.black)
                        
                    }
                    .padding(.bottom,40)
                    .cornerRadius(18)
                    
                    
                }.padding(.horizontal,15)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal,20)
                
                Form {
                    Section {
                        Picker(selection: $myGroup,
                               label: Text("그룹 선택")
                            .font(.bold16)
                        ) {
                            ForEach(0 ..< myGroups.count) {
                                Text(self.myGroups[$0])
                                    .font(.bold16)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                
                
                NavigationLink(
                    destination: studyView(myStudyTime: HomeView.$myStudyTime),
                    label: {
                        HStack{
                            Spacer()
                            Text("공부 시작하기")
                                .font(.bold16)
                                .foregroundColor(.symbolBlue)
                                .padding(.vertical,15)
                            Spacer()
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal,20)
                    })
                .padding(.bottom,30)
                
                
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
