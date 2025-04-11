//
//  ReviewsListViewModel.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import Foundation

@Observable
class ReviewsListViewModel {
    
    // MARK: Stored properties
    
    // Holds the list of books reviewed by the user
    var reviews: [Review]
    
    // MARK: Computed properties
    
    // MARK: Initializer(s)
    init() {
        
        // NOTE: Temporarily pre-populate with example reviews created earlier
        self.reviews = [review1, review2, review3]
    }
    
}
