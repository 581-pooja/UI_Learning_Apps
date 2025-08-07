//
//  ContentView.swift
//  WeatherApp
//
//  Created by Pooja4 Bhagat on 08/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Mumbai")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill",
                                      temperature: isNight ? 42: 30)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 30)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 35)
                    WeatherDayView(dayOfWeek: "THR",
                                   imageName: "wind",
                                   temperature: 29)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 35)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "moon.stars.fill",
                                   temperature: 28)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
/* - Order of Views or Modifiers matter in swiftui
 - Spacer() is count as view
 - One restriction: in overall view you can have only 10 views
 
 - In swiftui, a ui resource is watching a variable (source of truth) if the variable is
 changed then ui react towards it to give the desired output
 
 - ui is listening properly to variable
 - View are created and destroyed by the time. Views are very cheap are getting created and destroyed eg. content view
 Two ways to pass data:
 State:
 Binding: Passing the data from parent to child i.e. down in view heriarchy
 
 1. Create datamodel to pass easy
 2. api integrate in app (get next 5 days weather)
 
 Extension:
 1. Build model and refactor HStack with an array
 2. Get real data from a weather APi
 3. Build a tabBar that show multiple cities
 
 In SwiftUI, @State is a property wrapper used to declare a source of truth for data within a view. When the value of a @State variable changes, the view automatically re-renders to reflect the new value.
 
 
 */

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}
