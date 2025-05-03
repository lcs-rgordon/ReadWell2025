//
//  RemoteImageView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-05-03.
//

import SwiftUI

struct RemoteImageView: View {
    
    // MARK: Stored properties
    
    // Establish connection to the view model for this view
    @State var viewModel = RemoteImageViewModel()
    
    // MARK: Computed properties
    
    // The user interface to show
    var body: some View {
        VStack {

            // When an image has been loaded, show it
            if let downloadedImage = viewModel.image {
                downloadedImage.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            } else if viewModel.isLoading {
                // While an image is loading, show a spinner
                ProgressView()
            } else {
                // Otherwise, show nothing
                EmptyView()
            }
            
            // Provide a button to start loading a book cover image
            Button {
                
                // Loading an image over the Internet will take an unknown amount
                // of time, so it must be invoked inside an asynchronous task block
                Task {
                    await viewModel.loadImage(from: "https://covers.openlibrary.org/b/id/8982363-L.jpg")
                }
            } label: {
                Text("Load Book Cover Image")
            }
            .buttonStyle(.borderedProminent)
            
            // Show an error message, if there is one
            Text(viewModel.recoverySuggestion)

        }
    }
}

#Preview {
    RemoteImageView()
}
