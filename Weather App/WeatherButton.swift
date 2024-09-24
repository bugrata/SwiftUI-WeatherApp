//
//  WeatherButton.swift
//  Weather App
//
//  Created by Buğrahan Ata on 25.09.2024.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}
