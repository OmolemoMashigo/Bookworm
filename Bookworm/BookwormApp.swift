//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/10.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
