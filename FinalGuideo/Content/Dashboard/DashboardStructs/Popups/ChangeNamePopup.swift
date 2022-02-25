//
//  ChangeNamePopup.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var textEntered: String
    @Binding var showingAlert: Bool
    @Binding var backgroundOpacity: Bool
    
    var customBlue = Color(red: 0.455, green: 0.549, blue: 0.671)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(customBlue)
            
            VStack {
                
                Text("Prénom")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                TextField("Je m'appelle...", text: $textEntered)
                    .padding(10)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                HStack {
                    Button() {
                        self.showingAlert.toggle()
                        self.backgroundOpacity.toggle()
                    } label: {
                        Text("Accepter")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            
                    }
                }
                .padding(.horizontal, 40)
                .foregroundColor(.white)
                
            }
        }
        .frame(width: 300, height: 200)
        
    }
}
