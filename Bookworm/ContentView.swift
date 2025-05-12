//
//  ContentView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack{
            List(students){ student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar{
                Button("Add"){
                    
                    let firstNames = ["Bukayo", "Jurrien", "David", "Declan", "Gabriel", "Jakub", "William"]
                    
                    let lastNames = ["Saka", "Timber", "Raya", "Rice", "Magalaes", "Kiwior", "Saliba"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
