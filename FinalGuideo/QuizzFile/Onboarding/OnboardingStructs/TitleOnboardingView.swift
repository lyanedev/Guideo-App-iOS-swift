//
//  test.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct TitleView: View{
    var body: some View {
        
        Text("Guideo")
            .foregroundColor(.white)
            .font(.system(size: 80))
            .fontWeight(.bold)
        
        
        Text("L’app qui te guide dans ton orientation.")
            .font(.system(size: 20))
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(.bottom, 15)
        
    }
}
