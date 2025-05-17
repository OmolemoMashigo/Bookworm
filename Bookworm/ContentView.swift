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
    @Query(sort: \Book.rating, order: reverse) var books: [Book]
    
    @State private var showingScreen = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                        }
                        
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(.headline)
                            
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self){
                    book in DetailView(book: book)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add book", systemImage: "plus"){
                            showingScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingScreen){
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
