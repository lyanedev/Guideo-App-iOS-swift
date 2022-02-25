//
//  Helper.swift
//  FinalGuideo
//
//  Created by Apprenant 81 on 09/02/2022.
//

import SwiftUI


extension Color {
     init(hex: String) {
         let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
         var int: UInt64 = 0
         Scanner(string: hex).scanHexInt64(&int)
         let a, r, g, b: UInt64
         switch hex.count {
         case 3: // RGB (12-bit)
             (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
         case 6: // RGB (24-bit)
             (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
         case 8: // ARGB (32-bit)
             (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
         default:
             (a, r, g, b) = (1, 1, 1, 0)
         }
         
         
         self.init(
             .sRGB,
             red: Double(r) / 255,
             green: Double(g) / 255,
             blue:  Double(b) / 255,
             opacity: Double(a) / 255
         )
     }
 }

let pieColors = [
     Color.init(hex: "#2f4b7c"),
     Color.init(hex: "#003f5c"),
     Color.init(hex: "#665191"),
     Color.init(hex: "#a05195"),
     Color.init(hex: "#d45087"),
     Color.init(hex: "#f95d6a"),
     Color.init(hex: "#ff7c43"),
     Color.init(hex: "#ffa600")
]

func normalizedValue(index: Int, data: [ChartData]) -> Double {
     var total = 0.0
     data.forEach { data in
         total += data.value
     }
     return data[index].value/total
 }

struct PieSlice {
     var startDegree: Double
     var endDegree: Double
}

func angleAtTouchLocation(inPie pieSize: CGRect, touchLocation: CGPoint) ->  Double?  {
     let dx = touchLocation.x - pieSize.midX
     let dy = touchLocation.y - pieSize.midY
     
     let distanceToCenter = (dx * dx + dy * dy).squareRoot()
     let radius = pieSize.width/2
     guard distanceToCenter <= radius else {
         return nil
     }
     let angleAtTouchLocation = Double(atan2(dy, dx) * (180 / .pi))
     if angleAtTouchLocation < 0 {
         return (180 + angleAtTouchLocation) + 180
     } else {
         return angleAtTouchLocation
     }
 }
