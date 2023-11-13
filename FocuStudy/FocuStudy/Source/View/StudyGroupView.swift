//
//  StudyRoomView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI
struct Item: Identifiable {
    var id: Int
    var title: String
    var color: Color
}

class Store: ObservableObject {
    @Published var items: [Item]
    
    let colors: [Color] = [.red, .orange, .blue, .teal, .mint, .green, .gray, .indigo, .black]
    
    // dummy data
    init() {
        items = []
        for i in 0...7 {
            let new = Item(id: i, title: "Item \(i)", color: colors[i])
            items.append(new)
        }
    }
}

struct Group : Identifiable{
    var id = UUID()
    var groupName : String
    var groupDetail : String
    var groupPersonnel : String
    var groupImage : String
    var currentStudy : String
    var groupcolor : Color
}

struct StudyGroupView: View {
    var recent : [Group] = [
        Group(groupName: "토익 990점 맞기",groupDetail: "토익 990점을 맞기위해 어쩌고 저쩌고 ㅇ너라나어리ㅏㅓ마니ㅓㅇ라ㅓㅁ나ㅣ어라ㅣㅓㅁ나어라ㅣㅓㄴ아ㅣㅓ린어" , groupPersonnel: "15/60",groupImage: "books", currentStudy: "11", groupcolor: Color(red: 0.64, green: 0.46, blue: 0.93).opacity(0.87)),
        
        
        
        Group(groupName: "토익 990점 맞기",groupDetail: "토익 990점을 맞기위해 어쩌고 저쩌고 ㅇ너라나어리ㅏㅓ마니ㅓㅇ라ㅓㅁ나ㅣ어라ㅣㅓㅁ나어라ㅣㅓㄴ아ㅣㅓ린어" , groupPersonnel: "15/60",groupImage: "profile", currentStudy: "11", groupcolor: Color(red: 0.45, green: 0.66, blue: 0.43).opacity(0.87))
    ]
    @State private var newItem = ""
    
    
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

                                    Image(group.groupImage)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        
                                        Text(group.groupName)
                                            .font(.semiBold)
                                        
                                        Text(group.groupPersonnel)
                                            .font(.medium16)
                                    }
                                    .padding(.vertical,10)
                                    .padding(.horizontal,10)
                                    
                                    Spacer()
                                    Spacer()

                                    Button(action: {}) {
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
                                    Image(systemName: "plus")
                                    
                                })
                    )        }.background(Color.systemGray)
            }
        }

    }
}



struct popularGroupView: View {
    var popular : [Group] = [
        Group(groupName: "토익 990점 맞기",groupDetail: "토익 990점을 맞기위해 어쩌고 저쩌고 ㅇ너라나어리ㅏㅓ마니ㅓㅇ라ㅓㅁ나ㅣ어라ㅣㅓㅁ나어라ㅣㅓㄴ아ㅣㅓ린어" , groupPersonnel: "15/60",groupImage: "profile", currentStudy: "11", groupcolor: Color(red: 0.64, green: 0.46, blue: 0.93).opacity(0.87)),
        Group(groupName: "토익 990점 맞기",groupDetail: "토익 990점을 맞기위해 어쩌고 저쩌고 ㅇ너라나어리ㅏㅓ마니ㅓㅇ라ㅓㅁ나ㅣ어라ㅣㅓㅁ나어라ㅣㅓㄴ아ㅣㅓ린어" , groupPersonnel: "15/60",groupImage: "profile", currentStudy: "11", groupcolor: Color(red: 0.45, green: 0.66, blue: 0.43).opacity(0.87))
    ]
    
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
                                            .frame(width: 50,height: 50)
                                            .clipped()
                                    }
                                    HStack{
                                        Text(group.groupDetail)
                                            .frame(width: 190)
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
                                                
                                                Button(action: {}) {
                                                    HStack {
                                                        Text("참여하기")
                                                            .padding(.all,6)
                                                            .background(Color.white)
                                                            .foregroundColor(.indigo)
                                                            .cornerRadius(10)
                                                    }
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
