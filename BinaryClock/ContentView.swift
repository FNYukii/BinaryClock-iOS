//
//  ContentView.swift
//  BinaryClock
//
//  Created by Yu on 2022/01/26.
//

import SwiftUI

struct OneBinary: Identifiable {
    var id = UUID()
    var num: String
}

struct ContentView: View {
    
    // 24桁の2進数の各けたを一要素とした配列 ["1", "0", "0", "1", "0".......]
    @State var oneBinaries: [OneBinary] = []
            
    var body: some View {
        
        LazyHGrid(rows: Array(repeating: .init(.fixed(40)), count: 4), spacing: 6, content: {
            ForEach(oneBinaries) { oneBinary in
                
                // 1なら正方形を表示
                if oneBinary.num == "0" {
                    Color.clear
                        .frame(width: 40)
                } else {
                    Color.primary
                        .frame(width: 40)
                }
            }
        })
        .onAppear {
            updateClock()
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
        var newBinaryHhmmss = ""
        for i in 0..<hhmmss.count {
            let oneNumStr: String = String(hhmmss[hhmmss.index(hhmmss.startIndex, offsetBy: i)]) // "4" <- "451208"
            let binaryStr: String  = String(Int(oneNumStr)!, radix: 2) // "100" <- "4"
            let filledBinaryStr: String = String(format: "%04d", Int(binaryStr)!) // "0100" <- "100"
            newBinaryHhmmss += filledBinaryStr
        }
        
        // Create array ["1", "0", "0", "0", "1", "1", "0" .....] from "hhhhhhhhmmmmmmmmssssssss"
        var newOneBinaries: [OneBinary] = []
        for i in 0..<newBinaryHhmmss.count {
            let num = String(newBinaryHhmmss[newBinaryHhmmss.index(newBinaryHhmmss.startIndex, offsetBy: i)])
            newOneBinaries.append(OneBinary(num: num))
        }
    
        // Update binaryStrs
        oneBinaries = newOneBinaries
    }
}
