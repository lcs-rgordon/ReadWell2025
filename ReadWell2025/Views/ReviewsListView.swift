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
    
    // Manages the data used within this view
    @State var viewModel = ReviewsListViewModel()
    
    // Whether the sheet to add a new review is showing or not
    @State private var addNewReviewSheetIsShowing = false
    
    // What book is being searched for, if any
    @State var providedSearchText = ""
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                
                // Iterate over whatever is returned from the "searching" function
                List(
                    
                    searching(
                        originalList: viewModel.reviews,
                        against: providedSearchText
                    )
                    
                ) { currentReview in

                    NavigationLink {
                        ReviewDetailView(reviewToShow: currentReview)
                    } label: {
                        Text(currentReview.title)
                    }
                    
                }
                // Show a search bar at the top of the list
                // Connect the search bar to the "searchText" stored
                // property in the view model
                .searchable(text: $providedSearchText, prompt: "Search book titles")
                
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
            // Add a toolbar with a button to allow a new review to be authored
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        // This would show the add review sheet
                        addNewReviewSheetIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                
            }
            // Makes a sheet slide up showing AddReviewView
            .sheet(isPresented: $addNewReviewSheetIsShowing) {
                AddReviewView(isShowing: $addNewReviewSheetIsShowing)
                    // Make sure the add review view can access the view model that holds our list of reviews
                    .environment(viewModel)
            }
        }
    }
}

#Preview {
    ReviewsListView()
}
