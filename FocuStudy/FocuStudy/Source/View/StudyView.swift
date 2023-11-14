//
//  StudyView.swift
//  FocuStudy
//
//  Created by 최유경 on 11/14/23.
//

import SwiftUI

struct studyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var myStudyTime : Int
    
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
        var studyTime : Int

    }
    
    var studyPeople : [Studying] = [Studying(studyName: "양파", studyImage: "profile" , studyTime: 23010),
                                    Studying(studyName: "알파카", studyImage: "profile" ,studyTime: 9791),
                                    Studying(studyName: "아기돼지", studyImage: "profile",studyTime: 578),
                                    Studying(studyName: "고구마", studyImage: "profile",studyTime: 3781) ]
    
    
    
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
                            
                            StopWatchView(timeRemaining: 100, studyTime: study.studyTime)
                            
                        }
                        .padding()
                        .background(Color.white)
                            .cornerRadius(18)
                    }
                }
                .padding(.all,8)
            }
            .padding(.horizontal,10)
            
            
            VStack (spacing: 20){
                Image("profile")
                    .padding(.top,10)

                VStack(spacing:8){
                    Text("쿨냥이의 Focus Time")
                        .font(.bold16)
                        .foregroundColor(.black)
                    
                    StopWatchView(timeRemaining: 100, studyTime: 9000)
                }

            }
            .padding(.vertical,15)
            .padding(.horizontal,60)
            .background(Color.white)
            .cornerRadius(18)
            
            Spacer()

            HStack{
                Spacer()
                Text("공부 그만하기")
                    .font(.bold16)
                    .foregroundColor(.symbolBlue)
                    .padding(.vertical,15)
                Spacer()
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal,20)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
                
            }
            .padding(.bottom,30)

            
        }
        .background(Color.systemGray)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}


