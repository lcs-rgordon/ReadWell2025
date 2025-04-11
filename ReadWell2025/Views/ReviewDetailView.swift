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
                    
                    reviewToShow.coverImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
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

