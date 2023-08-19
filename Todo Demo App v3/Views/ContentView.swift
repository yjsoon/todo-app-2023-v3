//
//  ContentView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView {
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
            HowManyMoreView(todoManager: todoManager)
                .tabItem {
                    Label("Progress", systemImage: "number.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
