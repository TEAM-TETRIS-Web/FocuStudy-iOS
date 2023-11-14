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
                        TextField("Todo 입력", text: $newTodo, onCommit: addList)
                            .font(.bold16)
                        
                        Button(action: {
                            self.todos.append(self.newTodo)
                        }, label: {
                            Image("pencil")
                        })
                    }
                    .padding(.horizontal,20)
                    .padding(.top,15)
                    
                    Divider()
                        .padding(.bottom,10)
                        .padding(.horizontal,20)
                }
                
                List{
                    ForEach(todos,id : \.self) { todo in
                        VStack{
                            HStack{
                                Text(todo)
                                    .font(.bold16)
                                    .padding(.all,6)
                            }
                        }
                        .background(Color.blue10)
                        .cornerRadius(6)
                        .padding(.all,3)
                    }
                    .onDelete(perform: removeRow)
                }
                Spacer()
                
                
            }.background(Color.systemGray)
            .navigationTitle("TodoList")
            .toolbar {
                
                EditButton()
                    .foregroundColor(Color.gray80)
                    .font(.bold16)
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
            }
        }
        
    }
    func removeRow(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
}
