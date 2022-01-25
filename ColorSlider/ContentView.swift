//
//  ContentView.swift
//  ColorSlider
//
//  Created by Karina Sintceva on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderRed = Double.random(in: 0...1)
    @State private var sliderGreen = Double.random(in: 0...1)
    @State private var sliderBlue = Double.random(in: 0...1)
    @State private var textField = ""
    
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .opacity(0.5)
            VStack {
                ColorRectangleView(red: $sliderRed, green: $sliderGreen, blue: $sliderBlue)
                HStack {
                    ColorSliderView(value: $sliderRed, color: .red, colorMultiply: .red)
                    TFView(value: $textField)
                }
                HStack {
                    ColorSliderView(value: $sliderGreen, color: .green, colorMultiply: .green)
                    TFView(value: $textField)
                }
                HStack {
                    ColorSliderView(value: $sliderBlue, color: .blue, colorMultiply: .blue)
                    TFView(value: $textField)
                }
                Spacer()
            }
            .padding()
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    let colorMultiply: Color
    
    var body: some View {
        HStack {
            Text("\(value)").foregroundColor(color)
            Slider(value: $value).colorMultiply(colorMultiply)
        
        }
    }
}


struct ColorRectangleView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Rectangle()
            .frame(height: 200)
            .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1))
            .cornerRadius(40)
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray, lineWidth: 5))
    }
}

struct TFView: View {
    @Binding var value: String
    
    var body: some View {
        TextField("", text: $value)
            .textFieldStyle(.roundedBorder)
            .frame(width: 40, height: 40)
    }
}
