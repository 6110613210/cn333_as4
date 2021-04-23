//
//  Todo.swift
//  TodoApp
//
//  Created by Tham Thearawiboon on 22/4/2564 BE.
//

import Foundation

struct Todo : Identifiable{
    let id = UUID()
    let name: String
    let category: String
    
    static let categoryTypes = ["family","personal","work"]
}
