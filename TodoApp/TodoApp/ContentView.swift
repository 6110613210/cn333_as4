//
//  ContentView.swift
//  TodoApp
//
//  Created by Tham Thearawiboon on 22/4/2564 BE.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var repository: TodoRespository = TodoRespository()
    @State private var showAddTodoView = false
    var body: some View {
        NavigationView{
            List {
                ForEach(repository.tododb){
                    todo in NavigationLink(destination: TodoView(todo: todo, repository: repository)){
                        HStack{
                            Image(todo.category)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(todo.name)
                        }
                    }
                    .onLongPressGesture {
                        repository.upDateTodo(id: todo.id)
                    }
                }
                .onDelete{ indexSet in todoDeletion(offsets: indexSet)}
                //.onMove{ indices, newOffset in repository.todos.move(fromOffsets: indices, toOffset: newOffset)}
            }
            .navigationBarTitle("Todo Items")
            .navigationBarItems(
                leading: Button(action: {
                    showAddTodoView.toggle()
                }) {
                    Text("Add")
                }
                .sheet(isPresented: $showAddTodoView){
                    AddTodoView(repository: repository, showAddTodoView: $showAddTodoView)
                },
                trailing: EditButton())
            
        }
    }
    
    
    
    private func todoDeletion(offsets: IndexSet){
        for index in offsets {
            repository.remove(at: index)
        }
    }
    
    
}

struct TodoView: View{
    var todo: Tododb
    var repository: TodoRespository
    var body: some View{
        VStack{
            Text(todo.name)
            Image(todo.category)
                .resizable()
                .frame(width: 200, height: 200)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

