//
//  RecentGroupView.swift
//  FocuStudy
//
//  Created by 최유경 on 11/13/23.
//

import Foundation
import SwiftUI

struct recentGroupView: View {
    var recent : [Group] = [
        Group(groupName: "책벌레",groupDetail: "" , groupPersonnel: "3/10",groupImage: "books", currentStudy: "11", groupcolor: Color.blue10),
        
        
        Group(groupName: "React 스터디", groupDetail: "" , groupPersonnel: "12/30", groupImage: "react", currentStudy: "11", groupcolor: Color.blue10)
    ]
    @State private var newItem = ""
    @State var isButtonTapped = false
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    popularGroupView()
                    
                    Text("Recent")
                        .font(.bold24)
                        .padding(.top,5)
    
                    ScrollView{
                        VStack(alignment: .leading) {
                            ForEach(recent) { group in
                                HStack{
                                    Spacer()
                                    Spacer()

                                    HStack{
                                        Image(group.groupImage)
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                                                                
                                        VStack(alignment: .leading) {
                                            
                                            Text(group.groupName)
                                                .font(.semiBold)
                                            
                                            Text(group.groupPersonnel)
                                                .font(.medium16)
                                        }
                                        .padding(.vertical,10)
                                        .padding(.horizontal,10)
                                        Spacer()

                                        Button(action: {
                                            isButtonTapped = true
                                        }) {
                                            HStack {
                                                Text("참여하기")
                                                    .padding(.all,6)
                                                    .background(Color.gray10)
                                                    .foregroundColor(Color.gray80)
                                                    .cornerRadius(10)
                                            }
                                        }
                                        .padding(.horizontal,20)
                                        .padding(.vertical,10)
                                        .alert(isPresented: $isButtonTapped){
                                            Alert(title: Text("참여가 완료되었습니다"), message: nil,
                                                    dismissButton: .default(Text("확인")))
                                        }
                                    }
                                    Spacer()
                                }
                                
                            }
                            .background(Color.white)
                            
                            .cornerRadius(20)
                            .shadow(color: Color.gray20.opacity(0.3), radius: 6, x: 0, y: 3)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom:0, trailing: 20))
                        }
                        .padding(.top,10)
                    }
                    
                    .navigationTitle("Study Group")
                    .navigationBarItems(
                        trailing:
                            NavigationLink(
                                destination: MakingGroupView(),
                                label: {
                                    Image(systemName: "plus.square")
                                        .foregroundColor(Color.gray80)
                                    
                                })
                    )        }.background(Color.systemGray)
            }
        }

    }
}
