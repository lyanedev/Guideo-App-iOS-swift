//
//  OnboardingPrimaryButtonView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct StartButtonView: View{
    var text: String = ""
    var body: some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(.horizontal, 60.0)
            .padding(.vertical, 15.0)
            .foregroundColor(Color("primaryBlue"))
            .background(.white)
            .cornerRadius(50)
    }
}
