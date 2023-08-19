//
//  ContentView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: .all) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label: {
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
//                .swipeActions {
//                    Button {
//                        print("Hello world")
//                    } label: {
//                        Label("Circle", systemImage: "circle")
//                    }
//                    .tint(.orange)
//
//                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddTodoView(todos: $todoManager.todos)
                    .presentationDetents([.medium])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
