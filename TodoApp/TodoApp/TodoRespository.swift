//
//  TodoRespository.swift
//  TodoApp
//
//  Created by Macintosh HD on 22/4/2564 BE.
//

import Foundation
import Firebase

class TodoRespository: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var tododb: [Tododb] = []
    private let collectionName = "todos"
    
    init() {
        loadAll()
    }
    
    func newTodo(name: String, category: String){
        db.collection(collectionName).addDocument(data: [
            "name": name,
            "category": category
        
        ])
        loadAll()
    }
    
    func upDateTodo(id: String){
        db.collection(collectionName).document(id).updateData([
            "name": "Done"
        ]) { error in
            print(error ?? "Update failed.")
        }

        loadAll()
    }
    
    func remove(at index: Int){
        let todoToDelete = tododb[index]
        db.collection(collectionName).document(todoToDelete.id).delete()
        loadAll()
    }
    
    private func loadAll(){
        db.collection(collectionName).getDocuments { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            guard let documents = snapshot?.documents else {
                return
            }
            self.tododb = documents.compactMap { document in
                let data = document.data()
                guard let name = data["name"] as? String,
                      let category = data["category"] as? String
                else {
                    return nil
                }
                return Tododb(id: document.documentID,
                              name: name,
                              category: category)
            }
            
        }
    }
}
