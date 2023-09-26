//
//  TodoView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/09/25.
//

import SwiftUI

struct TodoView: View {
    
    struct TodoList: Identifiable, Codable {
        var id = UUID()
        var content: String
        var checked: Bool
    }
    
    @State var toDoString = ""
    @State private var todoLists = [TodoList]()
    
    var body: some View {
        VStack {            
            HStack {
                Image(systemName: "square.and.pencil")
                TextField(
                    "your task",
                    text: $toDoString,
                    onCommit: {
                        appendList()
                    }
                )
            }
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(width: 300, height: 50, alignment: .center)
            
            List {
                ForEach(0..<todoLists.count, id: \.self) { i in
                    HStack {
                        Button(action: {
                                toggleCheckedState(i)
                            },
                            label: {
                            Image(systemName:
                                todoLists[i].checked == true ?
                                "checkmark.square" :
                                "square")
                            }
                        )
                        Text(todoLists[i].content)
                        Spacer()
                        Button(
                            action: {
                                deleteList(i)
                            },
                            label: {
                                Image(systemName: "trash")
                            }
                        )
                        
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                }
            }.navigationBarItems(
                leading: EditButton(),
                   trailing:
                       NavigationLink(
                           destination: StartView(),
                           label: {
                               Image(systemName: "plus")
                                   .foregroundColor(.blue)
                           })
            )
        }
        .navigationBarTitle(Text("Study Group"))
            
            HStack(spacing: 50) {
                Button("Save", action: saveTodoList)
                    .padding(.all, 10)
                Button("Load", action: loadTodoList)
                    .padding(.all, 10)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
    }
    
    func saveTodoList() {
        
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        let jsonString = dataToJsonString()
        
        if jsonString == nil {
            print("Error: No JSON String found")
            return
        }
        
        print(path.absoluteString)
        
        do {
            try jsonString?.write(to: path, atomically: true, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadTodoList() {
        
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        
        do {
            let jsonString = try String(contentsOf: path)
            let jsonData = jsonStringToData(jsonString)
            
            if jsonData == nil {
                print("Error: No JSON Data found")
                return
            }
            
            todoLists = jsonData!
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getDocumentPath() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func dataToJsonString() -> String? {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(todoLists)
            return String(data: data, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func jsonStringToData(_ jsonString: String) -> [TodoList]? {
        
        let decoder = JSONDecoder()
        let jsonData = jsonString.data(using: .utf8)
        
        if jsonData == nil {
            print("Error: Cannot convert json String to Data")
            return nil
        }
        
        do {
            let gotList = try decoder.decode([TodoList].self, from: jsonData!)
            return gotList
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func appendList() {
         let inputList = TodoList(content: toDoString, checked: false)
         todoLists.append(inputList)
         toDoString = ""
     }
    
    func toggleCheckedState(_ i: Int) {
        todoLists[i].checked.toggle()
    }
    
    func deleteList(_ i: Int) {
        todoLists.remove(at: i)
    }
}
