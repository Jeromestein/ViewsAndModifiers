//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jiayi on 1/28/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    /**
     For more flexibility we could leverage the same @ViewBuilder attribute used by SwiftUI for the body property of its views.
     */
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    
}

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
        GridStack(rows: 4, columns: 4) { row, col in
            /**
             With that in place SwiftUI will now automatically create an implicit horizontal stack inside our cell closure:
             */
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
