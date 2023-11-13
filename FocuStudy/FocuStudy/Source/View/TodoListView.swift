//
//  TodoListView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI

struct TodoListView: View {
    @State private var multiSelection = Set<UUID>()
    
    @State private var newTodo = ""
    @State private var todos = [String]()
    
    func addList(){
        self.newTodo = ""
        print(newTodo)
    }
    
    var body: some View {
        NavigationView {
            
            VStack{
                VStack{
                    HStack{
                        TextField("Text Todo", text: $newTodo, onCommit: addList)
                        
                        Button(action: {
                            self.todos.append(self.newTodo)
                        }, label: {
                            Image(systemName: "pencil")
                        })
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)
                    
                    Divider()
                        .padding(.bottom,10)
                        .padding(.horizontal,20)
                }
                
                List {
                    ForEach(todos, id:\.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                .listStyle(.grouped)
            }
            .navigationTitle("TodoList")
            .toolbar { EditButton() }
        }.background(Color.systemGray)
        
    }
    func removeRow(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
}
