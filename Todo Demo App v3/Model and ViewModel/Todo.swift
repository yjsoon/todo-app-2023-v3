//
//  Todo.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID()
    var title: String
    var subtitle = ""
    var isDone = false
}
