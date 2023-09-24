//
//  MainView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 2

    var body: some View {
        TabView(selection: $selection) {
            Text("Study Room")
               //.badge(10)
               .tabItem {
                 Image(systemName: "studentdesk")
                 Text("Study Room")
               }
               .tag(1)
            
             Text("To do")
               .tabItem {
                 Image(systemName: "square.and.pencil")
                 Text("To do")
               }
               .tag(2)
            
             Text("Home")
               .tabItem {
                 Image(systemName: "house")
                 Text("Home")
               }
               .tag(3)
            
            Text("Community")
              .tabItem {
                Image(systemName: "text.bubble")
                Text("Community")
              }
              .tag(4)
            
        
            Text("My Page")
              .tabItem {
                Image(systemName: "person.circle.fill")
                Text("My Page")
              }
              .tag(5)
           }
           .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
