//
//  LoadingView.swift
//  weather-app
//
//  Created by Santtu Niskanen on 2.11.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        
    }
}

#Preview {
    LoadingView()
}
