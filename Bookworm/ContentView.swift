//
//  ContentView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/10.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColours = [Color.red, Color.yellow]
    var offColours = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColours : offColours, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
