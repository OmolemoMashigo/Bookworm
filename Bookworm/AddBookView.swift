//
//  AddBookView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/12.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Sci-fi", "Fantasy", "Kids", "Politics", "Horror", "Romance"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Book title", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section("Write a review"){
                    Picker("Rating", selection: $rating){
                        ForEach(0..<6){
                            Text(String($0))
                        }
                    }
                }
                
                Section{
                    Button("save"){
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        modelContext.insert(newBook)
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
