//
//  ReviewDetailView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct ReviewDetailView: View {
 
    // MARK: Stored properties
    let reviewToShow: Review
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("by \(reviewToShow.author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Divider()

                HStack {
                    
                    // Show a book cover image if one exists
                    if let coverImage = reviewToShow.coverImage {
                        coverImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125)
                    } else {
                        
                        // Otherwise show a placeholder
                        Image(systemName: "book.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 30))
                            .foregroundStyle(.tint)
                            .frame(width: 125)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        InfoDisplayView(
                            title: "Genre",
                            info: reviewToShow.genre
                        )
                        InfoDisplayView(
                            title: "Date Started",
                            info: reviewToShow.dateStarted.formatted(date: .long, time: .omitted)
                        )
                        InfoDisplayView(
                            title: "Date Finished",
                            info: reviewToShow.dateFinished.formatted(date: .long, time: .omitted)
                        )
                        
                    }
                    
                }
                
                StarRatingView(rating: reviewToShow.starRating)
                
                InfoDisplayView(
                    title: "Review",
                    info: reviewToShow.summary
                )
                
                Spacer()

            }
            .padding()
        }
        .navigationTitle(reviewToShow.title)
    }
}

#Preview {
    NavigationStack {
        ReviewDetailView(reviewToShow: review1)
    }
}

