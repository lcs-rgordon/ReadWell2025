//
//  RemoteImageViewModel.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-05-03.
//

import Foundation

@Observable
class RemoteImageViewModel: Observable {
    
    // MARK: Stored properties
    
    // Holds a book's cover image, once it is loaded
    var image: BookCoverImage?
    
    // Indicates to the view whether an image is in the process of being loaded
    var isLoading: Bool = false
    
    // Shows an error message, if necessary
    var recoverySuggestion = ""
    
    // MARK: Initializer(s)
    init(image: BookCoverImage? = nil) {
        self.image = image
    }
    
    // MARK: Function(s)
    
    // Load an image from a given URL
    func loadImage(from providedUrl: String) async {
        
        // Attempt to create an image from the provided image
        guard let imageUrl = URL(string: providedUrl) else {
            
            // Done attempting to load cover image
            self.isLoading = false
            self.recoverySuggestion = "Provided URL \(providedUrl) was not valid."
            
            // Quit this function
            return
        }
        
        // Flag that we are starting to load a book's cover image
        self.isLoading = true
        
        do {
            // Attempt to load the image data
            let imageData = try Data(contentsOf: imageUrl)
            
            // Populate the stored property of this view model with the image downloaded
            self.image = BookCoverImage(rawImageData: imageData)
            
            // Done loading the cover image
            self.isLoading = false
            
        } catch {
            print("Unable to load image data.")
        }
        
    }
    
    
}
