//
//  InfoDisplayView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct InfoDisplayView: View {
    
    // MARK: Stored properties
    let title: String
    let info: String
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.headline)
            Text(info)
                .padding(.bottom, 16)

        }
    }
}

#Preview {
    InfoDisplayView(title: "Genre", info: "Science Fiction")
}
