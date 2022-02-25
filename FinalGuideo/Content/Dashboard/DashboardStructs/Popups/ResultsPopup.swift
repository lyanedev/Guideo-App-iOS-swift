//
//  ResultsPopup.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct CustomAlertResults: View {
    @Binding var showingAlertResults: Bool
    @Binding var backgroundOpacity: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.orange)
            
            VStack {
                
                Spacer()
                
                Text("Résultats Quizz")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                
                VStack {
                    ProgressView("Aéronautique", value: Double(12), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                    
                    ProgressView("Informatique", value: Double(10), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                    
                    ProgressView("Commerce", value: Double(9), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                    
                    ProgressView("Architecture", value: Double(5), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                    
                    ProgressView("Mécanique", value: Double(3), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                    
                    ProgressView("Esthétique", value: Double(1), total: 14)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("primaryBlue")))
                        .padding(.horizontal, 20.0)
                }
                
                
                
                Spacer()
                
                HStack {
                    Button("Accepter") {
                        self.showingAlertResults.toggle()
                        self.backgroundOpacity.toggle()
                    }
                }
                .padding(30)
                .padding(.horizontal, 40)
                .foregroundColor(.white)
                
            }
        }
        .frame(width: 300, height: 400)
        
    }
}
