//
//  DataPersistence.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-14.
//

import Foundation

// NOTE: This function and constant are used when encoding user data to a JSON file
//       that is saved in the Documents directory on the user's device.

// Return the directory that we can save user data in
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
 
// Identify the file that data will be saved to in Documents directory
let fileLabel = "BookReviews"
