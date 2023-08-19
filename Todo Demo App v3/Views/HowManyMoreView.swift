//
//  HowManyMoreView.swift
//  Todo Demo App v3
//
//  Created by YJ Soon on 19/8/23.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
