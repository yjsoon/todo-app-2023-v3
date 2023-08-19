//
//  AddTodoView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct AddTodoView: View {
    
    @Binding var todos: [Todo]
    @State private var title = ""
    @State private var subtitle = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Enter a title", text: $title)
                TextField("Enter a subtitle", text: $subtitle)
            }
            
            Section {
                Button("Save", role: .none) {
                    // code to save the todo
                    let newTodo = Todo(title: title, subtitle: subtitle)
                    todos.append(newTodo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    // code to cancel
                    dismiss()
                }
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todos: .constant([]))
    }
}
