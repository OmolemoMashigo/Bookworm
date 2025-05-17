//
//  DetailView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/17.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "test", author: "test", genre: "Fantasy", review: "test", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    }catch{
        return Text("failed to create preview: \(error.localizedDescription)")
    }
    
}
