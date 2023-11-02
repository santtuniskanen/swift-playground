//
//  ContentView.swift
//  weather-app
//
//  Created by Santtu Niskanen on 2.11.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                     } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView().environmentObject(locationManager)
                    }
                }
        }
        .background(Color(hue: 0.637, saturation: 1.0, brightness: 0.494))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
