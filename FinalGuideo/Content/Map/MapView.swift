//
//  MapView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 09/02/2022.
//

import MapKit
import SwiftUI


extension Map {
    func mapStyle(_ mapType: MKMapType) -> some View {
        MKMapView.appearance().mapType = mapType
        return self
    }
}

struct MapView: View {
    @State private var searchText = ""
    let names = ["CFA de la Chambre des métiers", "EIC", "CFA Campus des métiers et de l'entreprise", "Ecole Silvya Terrade Paris", "ENAC Toulouse", "ENAC Montpellier", "Lycée professionnel Pierre Mendès France", "CFA des métiers de l'aerien", "Lycee ESAA Ecole Boulle", "Lycee Léonard de Vinci", "Lycée de Prony", "Lycée Gustave Eiffel", "Simplon", "Epitech Paris", "WIS - Web international school", "CFA IA l'intelligence apprentie - campus de Nantes", "Lycée Edouard Branly", "CFI Campus Paris", "Lycée Camille Jenatzy", "ISAE‑Supméca – Institut Supérieur de Mécanique de Paris", "ESVE - Ecole supérieur de vente et d'exportation", "Campus Montsouris (Cerfal)", "PPA Business School", "ECITV"]
    @StateObject private var viewModel = StructsMap()
    
    // On définit les coordonnées des lieux de formation, forum etc
    //    let locations = [
    //        Location(name: "Simplon", coordinate: CLLocationCoordinate2D(latitude: 48.8543116218374, longitude: 2.4366172071529926), img: Image("formation_img")),
    //        Location(name: "ENAC", coordinate: CLLocationCoordinate2D(latitude: 48.85396843363726, longitude: 2.4319144219330724), img: Image("formation_img"))]
    
    // On fait apparaitre la carte via Map, on met nos coordonnées dans coordinateRegion
    // on boucle sur la liste locations pour faire apparaitre toutes les annotationsItems (pose un point sur la carte)
    let locations = allCourseDescription
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                ///map
                Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true, annotationItems: locations) { location in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.longitude, longitude: location.latitude)){
                    
                    VStack{
                        NavigationLink(destination: CardCourseView(image : location.image, title : location.title, titleLoc : location.titleLoc, description : location.description, like: location.like, tel : location.tel, mail : location.mail, website : location.website, longitude : location.latitude, latitude : location.longitude)) {
                            Image("formation_img")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 40, height: 40)
                            
                        }
                        Text(location.titleLoc)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }}
                //.mapStyle(.hybrid)
                .ignoresSafeArea(.all, edges: .all)
                .onAppear{viewModel.checkIfLocationServicesIsEnabled()}
                ///
                
                VStack{
                    
                    VStack(spacing:  0){
                        HStack{
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                            
                            TextField("", text: $searchText)
                                .placeholder(when: searchText.isEmpty) {
                                    Text("Chercher").foregroundColor(.white).opacity(0.8)
                                        .font(.body)
                                }
                                .colorScheme(.light)
                                
                            
                            
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color("primaryBlue"))
                        .cornerRadius(25)
                        
                        // Displaying results
                        
                        if searchText != ""{
                            ScrollView{
                                VStack(spacing: 15)
                                {
                                    ForEach(searchResults, id: \.self) { result in
                                        Text("\(result)")
                                            .searchCompletion(result)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .cornerRadius(30)
                                            .onTapGesture {
                                                viewModel.selectPlace(position: result)
                                                searchText = ""
                                            }
                                        Divider()
                                    }
                                }.padding(.top)
                                
                            }
                            .background(Color("primaryBlue").opacity(0.7))
                        }
                        
                    }.padding()
                    
                    Spacer()
                    Button(action: viewModel.updatePos, label: {
                        
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(15)
                            .foregroundColor(.white)
                            .background(Color("primaryBlue"))
                            .clipShape(Circle())
                    })
                        .frame(width: 350, height: 250, alignment: .trailing)
                        .padding(.trailing, 15)
                    
                }
            }
        }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

// ---------------------------------------
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
