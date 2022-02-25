//
//  ContentView.swift
//  GuideoApp
//
//  Created by Lyane Lamara on 01/02/2022.
//

import SwiftUI

struct DashboardApp: View {
    var body: some View {
        TabView {
            Home()
        }
    }
}


struct Home: View {
    
    @State private var selectedtab =  "house.fill"
    
    var tabBarColor = Color("tabBarBlue")
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedtab){
                
                DashboardView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("house.fill")
                
                CoursesView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("graduationcap.fill")
                
                JobsView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("briefcase.fill")
                
                MapView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("map.fill")
            }
            
            
            HStack(spacing: 0){ 
                
                HStack {
                    
                    ForEach(tabs, id: \.self) {image in
                        
                        Button(action: {
                            withAnimation(.spring()){
                                selectedtab = image
                            }
                        }, label: {
                            
                            Image(systemName: image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(selectedtab == image ? Color.white : Color.gray)
                            
                        })
                        if image != tabs.last{Spacer(minLength: 0)}
                    }
                }
            }
            .frame(height: 40)
            .padding(.horizontal, 35)
            .padding(.vertical)
            .background(tabBarColor)
            .opacity(0.9)
            .cornerRadius(25)
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets
                        .bottom)
        }
        .ignoresSafeArea(.all, edges: . bottom)
    }
    
    // getting Image Color...
    func getColor(image: String) -> Color{
        
        switch image {
        case "house.fill":
            return Color.orange
        case "graduationcap.fill":
            return Color.green
        case "briefcase.fill":
            return Color.purple
        default:
            return Color.blue
        }
    }
    
}

var tabs = ["house.fill","graduationcap.fill","briefcase.fill","map.fill"]






struct DashboardApp_Previews: PreviewProvider {
    static var previews: some View {
        DashboardApp()
    }
}


