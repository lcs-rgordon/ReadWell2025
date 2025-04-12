//
//  Review.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

// NOTE: Adjustments to code to load an image from device storage were
//       co-developed with assistance from ChatGPT.
//       See acknowledgements section in README.
struct Review: Identifiable, Codable {
    
    // MARK: Stored properties
    let id: UUID
    let title: String
    let coverImageFilename: String?  // Store image file name
    let author: String
    let genre: String
    let dateStarted: Date
    let dateFinished: Date
    let starRating: Int
    let summary: String
    
    // MARK: Computed properties
    
    // Returns the image from the filename (loaded from Documents directory)
    var coverImage: Image? {
        guard let filename = coverImageFilename,
              let uiImage = loadImageFromDocuments(named: filename) else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
    
    // MARK: Initializer(s)
    init(id: UUID = UUID(),
         title: String,
         coverImageFilename: String?,
         author: String,
         genre: String,
         dateStarted: Date,
         dateFinished: Date,
         starRating: Int,
         summary: String) {
        
        self.id = id
        self.title = title
        self.coverImageFilename = coverImageFilename
        self.author = author
        self.genre = genre
        self.dateStarted = dateStarted
        self.dateFinished = dateFinished
        self.starRating = starRating
        self.summary = summary
    }
    
}
