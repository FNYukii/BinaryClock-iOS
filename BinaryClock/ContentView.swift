//
//  ContentView.swift
//  BinaryClock
//
//  Created by Yu on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
        
    var rows: [GridItem] = Array(repeating: .init(.fixed(50)), count: 4)
    
    var body: some View {
        
        LazyHGrid(rows: rows, alignment: .center, spacing: 2) {
            ForEach((1...24), id: \.self) { num in
                ZStack {
                    Rectangle().foregroundColor(.accentColor)
                        .frame(width: 40, height: 40)
                    Text("\(num)").foregroundColor(.white)
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                updateClock()
            }
        }
    }
    
    func updateClock() {
        
        // Create "hhmmss" string
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HHmmss", options: 0, locale: Locale(identifier: "ja_JP"))
        let hhmmssWithColon = dateFormatter.string(from: dt)
        let hhmmss = hhmmssWithColon.replacingOccurrences(of: ":", with: "")
        
        // TODO: Create binary "hhhhhhhhmmmmmmmmssssssss" from "hhmmss"
        
        // TODO: Create 24 squares
        
        print(hhmmss)
    }
}
