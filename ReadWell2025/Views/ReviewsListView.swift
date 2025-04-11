//
//  ReviewsListView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

// NOTE: This presents the main tab view interface of the app
struct ReviewsListView: View {
    
    // MARK: Stored properties
    @State var viewModel = ReviewsListViewModel()

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                
                List(viewModel.reviews) { review in

                    Text(review.title)
                    
                }
                // Remove borders around the list
                .listStyle(.plain)
                // Set the background colour behind the list to be brown
                .background {
                    Color.readWellBrown
                        .ignoresSafeArea()
                }
                // Make the background colour of the navigation bar pure white and visible
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)

            }
            .navigationTitle("Reviews")
        }
    }
}

#Preview {
    ReviewsListView()
}
