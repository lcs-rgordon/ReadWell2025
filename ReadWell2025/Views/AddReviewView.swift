//
//  AddReviewView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct AddReviewView: View {
    
    // MARK: Stored properties
    
    // Controls whether this sheet is showing or not
    @Binding var isShowing: Bool
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Text("This view is where a new review will be able to be added")
                .navigationTitle("Add Review")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        
                        Button {
                        
                            // Dismiss this sheet
                            isShowing = false
                            
                        } label: {
                            
                            Text("Done")
                            
                        }

                    }
                }
        }
    }
}

#Preview {
    AddReviewView(isShowing: Binding.constant(true))
}
