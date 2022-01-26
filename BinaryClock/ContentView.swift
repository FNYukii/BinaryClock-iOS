//
//  ContentView.swift
//  BinaryClock
//
//  Created by Yu on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var hhmmss = ""
    
    var body: some View {
        
        Text(hhmmss)
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
        let dt = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "HHmmss", options: 0, locale: Locale(identifier: "ja_JP"))
        hhmmss = dateFormatter.string(from: dt)
    }
}
