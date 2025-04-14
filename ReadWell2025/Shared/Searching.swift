//
//  Searching.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-14.
//

// Define the function
//
// name: searching
//
// inputs:
//          the original array (originaList)
//          what to search against (searchText)
//
// output: an array with instances of the Review data type that contain the search term
func searching(
    originalList: [Review],
    against searchText: String
) -> [Review] {
    
    // SEQUENCE (describe steps in order)
    
    // 0. If there is nothing to search against, return the entire array
    if searchText.isEmpty {
        return originalList
    }
    
    // 1. Make a new empty array
    var filteredList: [Review] = []
    
    // 2. Iterate over each item
    //    in the original array and decide
    //    whether to copy it to the filtered one
    //
    //    "item" points at each element in the array in turn
    for item in originalList {
        
        // 3. Decide whether to copy over
        //    e.g.: Say "searchText" is "Pride",
        //
        //          We will copy over only each item (an instance of the Review data type)
        //          where the provided search text matches some portion of a book's title.
        //
        //          So, for example, a review of "Pride and Prejudice" would be returned in
        //          the filtered list whereas a review of "Outlander" would not.
        if item.title.lowercased().contains(searchText.lowercased()) {
            filteredList.append(item)
        }
        
    }
    
    // 4. Return the filtered array
    return filteredList
    
}
