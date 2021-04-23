//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Tham Thearawiboon on 22/4/2564 BE.
//

import SwiftUI

struct AddTodoView: View {
    var repository: TodoRespository
    @State private var name = ""
    @State private var selectedCategory = 0
    @Binding var showAddTodoView:Bool
    
    private let categoryTypes = ["family","personal","work"]

    
    var body: some View {
        VStack{
            Text("Add Todo").font(.largeTitle)
            TextField("Todo Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
                .padding()
            Text("Select category")
            Picker("", selection: $selectedCategory){
                ForEach(0..<categoryTypes.count){
                    Text(categoryTypes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Button(action: {
                repository.newTodo(name: name, category: categoryTypes[selectedCategory])
                showAddTodoView = false
            })
            {
                Text("Done")
            }
        }
        .padding()
    }
}

/*struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(repository: TodoRespository(), showAddTodoView: .constant(true))
    }
}
 */
