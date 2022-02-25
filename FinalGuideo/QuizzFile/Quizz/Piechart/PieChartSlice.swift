//
//  PieChartSlice.swift
//  FinalGuideo
//
//  Created by Apprenant 81 on 09/02/2022.
//
import SwiftUI

struct PieChartSlice: View {
    
    var path: Path {
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
        path.addLine(to: center)
        path.closeSubpath()
        return path
        
    }
    
    var center: CGPoint
    var radius: CGFloat
    var startDegree: Double
    var endDegree: Double
    var isTouched:  Bool
    var accentColor:  Color
    var separatorColor: Color
    
    var body: some View {
        path
                 .fill(accentColor)
                 .overlay(path.stroke(separatorColor, lineWidth: 2))
                 .scaleEffect(isTouched ? 1.05 : 1)
                 .animation(Animation.spring())
    }
}

struct PieChartSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSlice(center: CGPoint(x: 100, y: 200), radius: 300, startDegree: 30, endDegree: 80, isTouched: true, accentColor: .orange, separatorColor: .black)
    }
}
