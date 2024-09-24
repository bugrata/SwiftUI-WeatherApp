//
//  ContentView.swift
//  Weather App
//
//  Created by Buğrahan Ata on 23.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Istanbul, Turkey")
                MainCityStatusView(weatherStatus: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                    
                HStack (spacing: 20){
                    DayView(dayName: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    DayView(dayName: "WED", imageName: "sun.max.fill", temperature: 74)
                    DayView(dayName: "THU", imageName: "wind.snow", temperature: 74)
                    DayView(dayName: "FRI", imageName: "sunset.fill", temperature: 74)
                    DayView(dayName: "SAT", imageName: "snow", temperature: 74)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct DayView: View {
    var dayName: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(){
            Text(dayName)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainCityStatusView: View {
    var weatherStatus: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: weatherStatus)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

