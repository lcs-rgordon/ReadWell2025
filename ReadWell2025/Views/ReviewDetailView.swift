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
                        Group {
                            Text("Genre")
                                .font(.headline)
                            Text(reviewToShow.genre)
                                .padding(.bottom, 16)
                        }
                        
                        Group {
                            Text("Date Started")
                                .font(.headline)
                            Text(reviewToShow.dateStarted.formatted(date: .long, time: .omitted))
                                .padding(.bottom, 16)
                        }
                        
                        Group {
                            Text("Date Finished")
                                .font(.headline)
                            Text(reviewToShow.dateFinished.formatted(date: .long, time: .omitted))
                                .padding(.bottom, 16)
                        }
                        
                        Spacer()
                    }
                    
                }
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
