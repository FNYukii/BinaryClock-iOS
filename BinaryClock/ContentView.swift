//
//  ContentView.swift
//  BinaryClock
//
//  Created by Yu on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
            
    var body: some View {
        
        LazyHGrid(rows: Array(repeating: .init(.fixed(40)), count: 4), spacing: 6, content: {
            ForEach(0..<24) { index in
                ZStack {
                    Color.accentColor
                        .frame(width: 40)
                    Text("\(index)")
                }
                
            }
        })
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
        let hhmmss: String = hhmmssWithColon.replacingOccurrences(of: ":", with: "")
        print(hhmmss)

        // Create binary "hhhhhhhhmmmmmmmmssssssss" from "hhmmss"
        var binaryHhmmss = ""
        for i in 0..<hhmmss.count {
            let oneNumChar: String = String(hhmmss[hhmmss.index(hhmmss.startIndex, offsetBy: i)]) // "4" <- "451208"
            let binaryStr: String  = String(Int(oneNumChar)!, radix: 2) // "100" <- "4"
            let filledBinaryStr: String = String(format: "%04d", Int(binaryStr)!) // "0100" <- "100"
            binaryHhmmss += filledBinaryStr
        }
        print(binaryHhmmss)
        
        // TODO: Create 24 squares
        
    }
}
