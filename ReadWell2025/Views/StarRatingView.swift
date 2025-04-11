//
//  StarRatingView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

// NOTE: This code was co-developed with the help of a large language model (ChatGPT).

//       You can view my conversation with ChatGPT here:
//       https://chatgpt.com/share/67f9a949-5640-800b-8bfc-aa940c172711
//
struct StarRatingView: View {
    
    // MARK: Stored properties
    let rating: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {

            Text("Star Rating")
                .font(.headline)
            
            HStack {
                
                // Draw the filled-in stars
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                // Draw the empty stars
                ForEach(rating..<5, id: \.self) { _ in
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3)
}

#Preview {
    StarRatingView(rating: 5)
}
