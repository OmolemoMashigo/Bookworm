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
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
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
                                .foregroundColor(book.rating > 1 ? .black : .red)
                            
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self){
                    book in DetailView(book: book)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                    
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
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            modelContext.delete(book)
        }
        print("delete")
    }
}

#Preview {
    ContentView()
}
