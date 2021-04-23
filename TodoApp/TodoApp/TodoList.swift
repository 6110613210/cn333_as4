//
//  TodoList.swift
//  TodoApp
//
//  Created by Tham Thearawiboon on 22/4/2564 BE.
//

import Foundation

class TodoList: ObservableObject{
    @Published var todos: [Todo] = [
        Todo(name: " Write book", category: "work"),
        Todo(name: " Read cartoon", category: "personal"),
        Todo(name: " Meet my relative", category: "family")
    ]
    
    func addTodo(name: String, category: String){
        todos.append(Todo(name: name, category: category))
    }
}
