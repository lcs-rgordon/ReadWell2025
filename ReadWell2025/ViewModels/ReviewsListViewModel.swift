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
    var reviews: [Review] = []
    
    // MARK: Computed properties
    
    // MARK: Initializer(s)
    init() {
        
        // Get list of saved reviews from device storage
        loadSavedBookReviews()
    }
    
    // MARK: Function(s)
    
    // Add a review to the list of reviews
    func add(review: Review) {
        
        // Add the new review to the array
        reviews.append(review)
        
        // Persist the list of book reviews to device storage
        self.persistBookReviews()
        
    }
    
    // Load saved book reviews from file on device
    func loadSavedBookReviews() {
        
        // Get a URL that points to the saved JSON data containing our list of favourite jokes
        let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
        
        print("Filename we are reading persisted data is:")
        print(filename)
        
        // Attempt to load from the JSON in the stored file
        do {
            
            // Load the raw data
            let data = try Data(contentsOf: filename)
            
            print("Got data from file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            // Decode the data into Swift native data structures
            self.reviews = try JSONDecoder().decode([Review].self, from: data)
            
        } catch {
            
            print(error)
            print("Could not load data from file, initializing with empty list.")
            
            self.reviews = []
        }
        
    }
    
    // Write saved book reviews to file on device
    func persistBookReviews() {
        
        // Get a URL that points to the saved JSON data containing our list of people
        let filename = getDocumentsDirectory().appendingPathComponent(fileLabel)
        
        print("Filename we are writing data to is:")
        print(filename)
        
        do {
            
            // Create an encoder
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            // Encode the list of book reviews we've authored
            let data = try encoder.encode(self.reviews)
            
            // Actually write the JSON file to the documents directory
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            print("Wrote data to file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            print("Saved data to documents directory successfully.")
            
        } catch {
            
            print(error)
            print("Unable to write list to documents directory.")
        }
        
    }
    
}
