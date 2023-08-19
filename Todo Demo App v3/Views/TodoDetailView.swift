//
//  TodoDetailView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            Section {
                TextField("Enter todo title", text: $todo.title)
                TextField("Enter todo subtitle", text: $todo.subtitle)
            }
            Section {
                Toggle("Is done?", isOn: $todo.isDone)
            }
        }
        .navigationTitle("Details")

    }
}

struct TodoDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            TodoDetailView(todo: .constant(Todo(title: "Fake Todo")))
        }
    }
}
