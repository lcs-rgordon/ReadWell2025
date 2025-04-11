//
//  OpeningView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct OpeningView: View {
    
    // MARK: Stored properties
    @State private var hasChosenToGetStarted = false
    
    // MARK: Computed properties
    var body: some View {
        
        if hasChosenToGetStarted == false {
            SplashScreenView(getStartedTapped: $hasChosenToGetStarted)
        } else {
            LandingView()
        }
        
    }
}

#Preview {
    OpeningView()
}
