//
//  MainView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case studyGroup = 0
    case todoList
    case home
    case myPage
    
    var title: String{
        switch self {
        case .studyGroup:
            return "Group"
        case .todoList:
            return "Todo"
        case .home:
            return "Home"
        case .myPage:
            return "MyPage"
        }
    }
    
    var iconName: String{
        switch self {
        case .studyGroup:
            return "book"
        case .todoList:
            return "square.and.pencil"
        case .home:
            return "house"
        case .myPage:
            return "person.circle.fill"
        }
    }
}

struct MainTabbedView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                StudyGroupView()
                    .tag(0)

                TodoListView()
                    .tag(1)

                HomeView()
                    .tag(2)

                MyPageView()
                    .tag(3)
            }

            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 60)
            .background(Color.blue20.opacity(0.7))
            .cornerRadius(20)
            .padding(.horizontal, 26)
        }
    }
}

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 50)
        .background(isActive ? Color.symbolBlue.opacity(0.4) : .clear)
        .cornerRadius(20)
    }
}
