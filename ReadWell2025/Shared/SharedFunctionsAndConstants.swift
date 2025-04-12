//
//  SharedFunctionsAndConstants.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import Foundation
import UIKit
 
// Return the directory that we can save user data in
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
 
// Identify the file that data will be saved to in Documents directory
let fileLabel = "BookReviews"

// NOTE: The following two functions were co-developed with assistance from ChatGPT.
// See acknowledgements section in README.

// Save a UIImage to Documents directory and return the filename
func saveImageToDocuments(_ image: UIImage) -> String? {
    let filename = UUID().uuidString + ".png"
    let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
    
    if let data = image.pngData() {
        do {
            try data.write(to: fileURL)
            return filename
        } catch {
            print("Error saving image: \(error)")
        }
    }
    return nil
}

// Load a UIImage from Documents directory
func loadImageFromDocuments(named filename: String) -> UIImage? {
    let fileURL = getDocumentsDirectory().appendingPathComponent(filename)
    return UIImage(contentsOfFile: fileURL.path)
}
