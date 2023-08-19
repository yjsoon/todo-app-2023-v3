//
//  MainTodoListView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct MainTodoListView: View {
    
    @ObservedObject var todoManager: TodoManager
    @State private var showAddSheet = false
    @State private var showLoadSampleAlert = false

    
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
                
                ToolbarItemGroup {
                   
                    #if DEBUG
                    Button {
                        showLoadSampleAlert = true
                    } label: {
                        Label("Load sample data", systemImage: "clipboard")
                    }
                    #endif

                    Button {
                        showAddSheet = true
                    } label: {
                        Label("Add todo", systemImage: "plus")
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
            .alert("Load sample data? Warning: Cannot undo!", isPresented: $showLoadSampleAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleTodos()
                }
            }
        }

    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
