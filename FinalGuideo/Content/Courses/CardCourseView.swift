//
//  CardCourseView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let img: Image
}

struct CardCourseView: View {
    @State private var isButtonClicked: Bool = false
    @StateObject private var viewModel = StructsMap()
    // On définit les coordonnées des lieux de formation, forum etc
    let locations = allCourseDescription
    
    var image: String
    var title: String
    var titleLoc: String
    var description: String
    var like: Bool
    var tel: String
    var mail: String
    var website: String
    var longitude: Double
    var latitude: Double
    
    var body: some View {
        VStack{
            ScrollView {
                ZStack {
                    Image(image)
                        .resizable()
                        .frame(height: 160.0)
                        .zIndex(1)
                        .ignoresSafeArea(.all)
                }
                
                HStack {
                    Text(titleLoc)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    
                    Button(action: {
                        isButtonClicked.toggle()
                    }) {
                        isButtonClicked ? Image(systemName: "bookmark.fill").foregroundColor(.red).font(.system(size: 30)) : Image(systemName: "bookmark").foregroundColor(.red).font(.system(size: 30))
                    }.frame(width: 120, height: 50)
                }
                
                Text(description)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15.0)
                
                Text("Contacts")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .frame(height: 30)
                    .foregroundColor(Color("categoryBlue"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                VStack{
                    FormationInfoNumView(numero: tel)
                        .padding(.bottom, 2)
                    FormationInfoSiteView(site: website)
                }
                .frame(width: 200, height: 20)
                .foregroundColor(.orange)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Text("Carte")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .frame(height: 30)
                    .foregroundColor(Color("categoryBlue"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Map(coordinateRegion: $viewModel.mapRegionSave, showsUserLocation: true, annotationItems: locations) {location in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.longitude, longitude: location.latitude)){
                    VStack{
                        Image("formation_img")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 40, height: 40)
                        Text(location.titleLoc)
                    }
                }}
                .frame(width: 350, height: 250, alignment: .center)
                .cornerRadius(15)
                .onAppear{viewModel.checkIfLocationServicesIsEnabled()}
                .padding(.bottom, 100.0)
            }
        }
    }
}


struct FormationInfoNumView: View {
    
    let numero : String
    
    
    var body: some View {
        Link(numero, destination: URL(string: "tel:\(numero)")!)
            .font(.system(size: 22))
            //.fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        
        
        
    }
}
struct FormationInfoSiteView: View {
    
    
    let site : String
    
    
    var body: some View {
        Link(site, destination: URL(string: "https://\(site)")!)
                    .font(.system(size: 22))
                    .frame(maxWidth: .infinity, alignment: .leading)
        
        
        
        
    }
}

struct CardCourseView_Previews: PreviewProvider {
    static var previews: some View {
        CardCourseView(image : "", title : "", titleLoc : "titleLoc", description : "description", like: false, tel : "0678908788", mail : "", website : "www.test.com", longitude : 0.0, latitude : 0.0)
    }
}
