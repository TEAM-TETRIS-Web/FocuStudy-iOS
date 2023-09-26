//
//  StudyRoomView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI

struct StudyGroupView: View {
    @State private var searchText = ""
    
    @State private var isShowImage : Bool = true
    @State private var testlist : [TestItem] =
    [
        TestItem(text: "토익 990점 맞기!", image: "globe"),
        TestItem(text: "전공 A+ 받을 모임", image: "a.circle"),
        TestItem(text: "새벽에 같이 공부하장", image: "book"),
        TestItem(text: "공대생들의 스터디", image: "pencil"),
        TestItem(text: "정처기 자격증 뿌시기", image: "bolt"),
        
    ]
    
    var body: some View{
        NavigationView {
            VStack{
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    Section(header: Text("My Group")){
                        ForEach(testlist) {item in
                            HStack{
                                NavigationLink(
                                    destination: Text(item.text),
                                    label: {
                                        if isShowImage {
                                            Image(systemName: item.image)
                                        }
                                        Text(item.text)
                                    })
                            }
                        }.onDelete(perform: { indexSet in
                            // 삭제 동작
                            testlist.remove(atOffsets: indexSet)
                        }).onMove(perform: { indices, newOffset in
                            testlist.move(fromOffsets: indices, toOffset: newOffset)
                        })
                    }
                    
                }
        }
    }
    
}




struct TestItem : Identifiable {
    var id = UUID()
    var text : String
    var image : String
}
