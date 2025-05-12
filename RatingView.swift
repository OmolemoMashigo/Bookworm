//
//  RatingView.swift
//  Bookworm
//
//  Created by Omolemo Mashigo on 2025/05/12.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColour = Color.gray
    var onColour = Color.yellow
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self){ number in
                Button{
                   rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColour :  onColour)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image{
        if number > rating{
            offImage ?? onImage
        } else{
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
