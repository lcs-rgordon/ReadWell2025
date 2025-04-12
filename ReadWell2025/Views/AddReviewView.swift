//
//  AddReviewView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct AddReviewView: View {
    
    // MARK: Stored properties
    
    // These properties hold the information provided by a user as they type
    // information into the view to create a review
    @State var title: String = ""
    @State var author: String = ""
    @State var genre: String = ""
    @State var dateStarted: Date = Date()
    @State var dateFinished: Date = Date()
    @State var starRating: Int = 1
    @State var review: String = ""
    
    // Controls whether this sheet is showing or not
    @Binding var isShowing: Bool
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Book Details")) {
                    
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Genre", text: $genre)
                    
                }
                
                Section(header: Text("Reading Dates")) {
                    DatePicker("Date Started", selection: $dateStarted, in: ...Date(), displayedComponents: .date)
                    DatePicker("Date Finished", selection: $dateFinished, in: dateStarted...Date(), displayedComponents: .date)
                }
                
                Section(header: Text("Rating")) {
                    Picker("Star Rating", selection: $starRating) {
                        Text("★").tag(1)
                        Text("★★").tag(2)
                        Text("★★★").tag(3)
                        Text("★★★★").tag(4)
                        Text("★★★★★").tag(5)
                    }
                    .pickerStyle(.menu)
                    
                }
                
                Section(header: Text("Review")) {
                    TextEditor(text: $review)
                        .frame(height: 200)
                }
                                
            }
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
