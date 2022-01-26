//
//  ContentView.swift
//  BinaryClock
//
//  Created by Yu on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var str = ""
    
    var body: some View {
        
        Text(str)
            .font(.title)
            .padding()
            .onAppear {
                updateClock()
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    updateClock()
                }
            }
    }
    
    func updateClock() {
        
        // Create hhmmss string
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HHmmss", options: 0, locale: Locale(identifier: "ja_JP"))
        let hhmmssWithColon = dateFormatter.string(from: dt)
        let hhmmss = hhmmssWithColon.replacingOccurrences(of: ":", with: "")
        
        str = hhmmss
    }
}
