//
//  WeatherView.swift
//  weather-app
//
//  Created by Santtu Niskanen on 2.11.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.moon")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image.resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding().padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.637, saturation: 1.0, brightness: 0.494))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.637, saturation: 1.0, brightness: 0.494))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
