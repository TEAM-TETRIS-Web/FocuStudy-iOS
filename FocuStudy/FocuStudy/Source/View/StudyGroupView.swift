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
    
    
    var body: some View {
        VStack{
            recentGroupView()
        }
        .background(Color.systemGray)
        .navigationTitle("Study Group")
        .navigationBarItems(
            trailing:
                NavigationLink(
                    destination: MakingGroupView(),
                    label: {
                        Image(systemName: "plus.square")
                            .foregroundColor(Color.gray80)
                        
                    })
        )        }
}


struct MakingGroupView: View {
    @State var groupName: String = ""
    @State var groupDetail: String = ""
    @State private var personNumber = ""
    @State var ispublicTapped = false
    @State var isprivateTapped = false

    @Environment(\.presentationMode) var presentationMode
    
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
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("그룹 이름")
                        .font(.bold16)
                    Spacer()
                }
                
                TextField("", text: $groupName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)

                Spacer()
                HStack{
                    Text("그룹 설명")
                        .font(.bold16)
                    Spacer()
                }
                
                TextField("", text: $groupDetail)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)

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
                            .foregroundColor(ispublicTapped ? .symbolBlue : .gray80)
                        Spacer()
                    }
                    .padding(.vertical,10)
                    .background(ispublicTapped ? Color.gray20.opacity(0.7) : Color.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        ispublicTapped = true
                        isprivateTapped = false
                    }
                    
                    HStack{
                        Spacer()
                        Text("비공개")
                            .font(.bold16)
                            .foregroundColor(isprivateTapped ? .symbolBlue : .gray80)
                        Spacer()
                    }
                    .padding(.vertical,10)
                    .background(isprivateTapped ? Color.gray20.opacity(0.7) : Color.white)
                    .cornerRadius(12)
                    .onTapGesture {
                        isprivateTapped = true
                        ispublicTapped = false
                    }
                }
                .padding(.top,0)
                .padding(.bottom,60)
                
                Spacer()
                
                Button(action: {}) {
                    HStack{
                        Spacer()
                        Text("방 만들기")
                            .font(.bold16)
                            .foregroundColor(Color.gray80)
                        Spacer()
                    }
                    .padding(.vertical,12)
                    .background(Color.white)
                    .cornerRadius(12)
                }
                
                Spacer()
                
            }

            .padding(.horizontal,20)
        }
        .background(Color.systemGray)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
}

struct StudyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        StudyGroupView()
    }
}
//            HStack{
//                Text("사람 수")
//                    .font(.bold16)
//
//                Spacer()
//            }
//            Section {
//                TextField("사람 수", text: $personNumber)
//                    .keyboardType(.decimalPad)  //키패드 종류(숫자)
//            }
