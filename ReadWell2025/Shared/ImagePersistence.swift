//
//  SharedFunctionsAndConstants.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import Foundation
import UIKit
 
// NOTE: These functions are used when saving an image associated with a book review
//       to the Documents directory on the user's device.
//
//       It is not practical to encode an image to JSON, so instead, we save the
//       image file itself to the Documents directory. Then, in the JSON file that stores
//       the list of book reviews, we save the location (file name and path) that lead to
//       where the image was saved as a PNG file.
//
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
