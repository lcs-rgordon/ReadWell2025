//
//  ContentView.swift
//  ReadWell2025
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct SplashScreenView: View {
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
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    SplashScreenView()
}
