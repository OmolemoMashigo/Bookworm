//
//  ContentView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/10.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
