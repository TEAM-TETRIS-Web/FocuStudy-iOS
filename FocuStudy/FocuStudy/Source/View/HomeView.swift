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
                        
                        Text("02:10:35")
                            .font(.extraBold)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical,60)
                    .padding(.horizontal,80)
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
                    destination: studyView(),
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
}



struct studyView: View {
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
    
    struct Studying : Identifiable{
        var id = UUID()
        var studyName : String
        var studyImage : String
    }
    
    var studyPeople : [Studying] = [Studying(studyName: "정지윤", studyImage: "profile"),
                                    Studying(studyName: "양민서", studyImage: "profile"),
                                    Studying(studyName: "박상규", studyImage: "profile"),
                                    Studying(studyName: "황기중", studyImage: "profile") ]
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text("토익 990점 뿌시기")
                    .font(.bold24)
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding(.horizontal,20)
            
            ScrollView(.horizontal){
                HStack(spacing : 15){
                    ForEach(studyPeople) { study in
                        VStack{
                            Image(study.studyImage)
                                .resizable()
                                .frame(width: 115,height: 100)
                                .clipped()
                            
                            Text(study.studyName)
                                .font(.bold16)
                                .foregroundColor(.black)
                        }   .background(Color.white)
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
            .padding(.horizontal,10)
            
            Spacer()
            
            HStack{
                Image("profile")
                
                VStack(spacing:8){
                    Text("Focus TIME")
                        .font(.bold16)
                        .foregroundColor(.black)
                    
                    Text("02:10:35")
                        .font(.bold24)
                        .foregroundColor(.symbolBlue)
                }
            }
            .padding(.vertical,20)
            .padding(.horizontal,30)
            .background(Color.white)
            .cornerRadius(18)
            .padding(.bottom,30)
            
            HStack{
                Spacer()
                Text("공부 그만하기")
                    .font(.bold16)
                    .foregroundColor(Color.symbolBlue)
                    .padding(.vertical,15)
                Spacer()
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal,30)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
                
            }
            
            Spacer()
            Spacer()
            
        }
        .background(Color.systemGray)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    HomeView()
}
