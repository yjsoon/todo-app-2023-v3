//
//  ContentView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "Get up", isDone: true),
        Todo(title: "Eat breakfast", subtitle: "McGriddles Stack"),
        Todo(title: "Brush teeth"),
        Todo(title: "Go to school")
    ]
    
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                HStack {
                    Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isDone.toggle()
                        }
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .strikethrough(todo.isDone)
                        if !todo.subtitle.isEmpty {
                            Text(todo.subtitle)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
