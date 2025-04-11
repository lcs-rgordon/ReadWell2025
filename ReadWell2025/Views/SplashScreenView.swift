//
//  ContentView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct SplashScreenView: View {
    
    // MARK: Stored properties
    
    // Tracks whether the user has asked to move past the start screen
    @Binding var getStartedTapped: Bool
    
    var body: some View {
        ZStack {
            
            // First layer
            Color.readWellBrown
                .ignoresSafeArea()
            
            // Second layer
            VStack {
                Spacer()
                Text("ReadWell")
                    .foregroundStyle(Color.white)
                    .font(
                        .custom(
                            "Papyrus",
                            size: 64.0,
                            relativeTo: .largeTitle
                        )
                    )
                    .rotationEffect(
                        Angle(
                            degrees: -5
                        ),
                        anchor: .center
                    )
                
                Spacer()
                
                Image("ReadingJournal")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text("Get Started")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                    .onTapGesture {
                        // Fade between splash screen and the next view
                        withAnimation {
                            getStartedTapped = true
                        }
                    }
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    
    @Previewable @State var getStartedTapped = false
    
    SplashScreenView(getStartedTapped: $getStartedTapped)
    
}
