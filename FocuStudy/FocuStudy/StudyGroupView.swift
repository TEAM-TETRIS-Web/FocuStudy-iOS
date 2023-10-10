//
//  StudyRoomView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI


struct Group : Identifiable{
    var id = UUID()
    var groupName : String
    var groupPersonnel : String
    
}

struct StudyGroupView: View {
    var array : [Group] = [Group(groupName: "토익 990점 맞기", groupPersonnel: "1/10"),
                           Group(groupName: "전공 A+ 받을사람", groupPersonnel: "8/43"),
                           Group(groupName: "전공 A+ 받을사람", groupPersonnel: "8/43")
                           
    ]
    @State private var newItem = ""
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading) {
                    ForEach(array) { group in
                        HStack{
                            VStack(alignment: .leading) {
                                
                                Text(group.groupName)
                                    .font(.semiBold)
                                
                                Text(group.groupPersonnel)
                                    .font(.medium16)
                            }
                            
                            .padding(EdgeInsets(top: 10, leading: 20, bottom:10, trailing: 20))
                            Spacer()
                        }
                        
                    }
                    .background(Color.white)
                    
                    .cornerRadius(20)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 4)
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
                            Image(systemName: "plus")
                            
                        })
            )        }
    }
}

struct MakingGroupView: View {
    @State var groupName: String = ""
    @State var groupDetail: String = ""
    @State private var personNumber = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack{
            HStack{
                Text("그룹 이름")
                    .font(.bold16)
                Spacer()
            }
            TextField("Enter your groupName", text: $groupName)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            
            Spacer()
            HStack{
                Text("그룹 설명")
                    .font(.bold16)
                Spacer()
            }
            TextField("Enter your groupDetail", text: $groupDetail)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            Spacer()

            HStack{
                Text("사람 수")
                    .font(.bold16)
                
                Spacer()
            }
            Section {
                TextField("사람 수", text: $personNumber)
                    .keyboardType(.decimalPad)  //키패드 종류(숫자)
            }
                        
            Spacer()

            
            HStack{
                Text("공개 여부")
                    .font(.bold16)
                
                Spacer()
            }
            
            HStack(spacing:10){
                HStack{
                    Spacer()
                    Text("공개")
                        .font(.bold16)
                        .foregroundColor(.symbolBlue)
                    Spacer()
                }
                .padding(.vertical,10)
                .background(Color.gray40)
                .cornerRadius(12)
                
                HStack{
                    Spacer()
                    Text("비공개")
                        .font(.bold16)
                        .foregroundColor(.gray80)
                    Spacer()
                }
                .padding(.vertical,10)
                .background(Color.gray20)
                .cornerRadius(12)
            }
            .padding(.horizontal,20)
            .padding(.top,0)
            .padding(.bottom,60)
            
            Spacer()
            
            HStack{
                Spacer()
                Text("방 만들기")
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

struct StudyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        StudyGroupView()
    }
}
