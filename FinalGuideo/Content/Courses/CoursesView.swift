//
//  JobsView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct CoursesView: View {
    @State private var searchText = ""
    //let names = ["Pilote de ligne", "Mécanicien", "Coiffeur", "Ingénieur", "Exemple", "Testeur de fromages"]
    var gridItems: [GridItem] = [GridItem(.fixed(185)),
                                 GridItem(.fixed(185))]
    
    var customBlue = Color(red: 47/255, green: 48/255, blue: 71/255)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
                    ForEach(allCourseDescription) { values in
                        VStack {
                            NavigationLink(destination: CardCourseView(image : values.image, title : values.title, titleLoc : values.titleLoc, description : values.description, like: values.like, tel : values.tel, mail : values.mail, website : values.website, longitude : values.latitude, latitude : values.longitude)) {

                                ZStack {
                                    
                                    Image(values.image)
                                        .resizable()
                                        .frame(width: 170, height: 180, alignment: .center)
                                        .cornerRadius(20)
                                        .scaledToFit()
                                        .shadow(color: customBlue.opacity(0.3), radius: 5, x: 0, y: 10)
                                    
                                    
                                    ZStack {
                                        
                                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.black.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(20)
                                            .frame(width: 170, height: 180, alignment: .bottom)
                                        
                                        
                                        
                                        Text(values.titleLoc)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.body)
                                            .frame(width: 173, height: 185, alignment: .bottom)
                                            .padding([.leading, .bottom, .trailing], 30.0)
                                        
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)){
//                    ForEach(searchResults, id: \.self) { result in
//                        Text("\(result)").searchCompletion(result)
//                    }
                }
            }
            .navigationBarTitle(Text("Parcours"), displayMode: .inline)
        }
    }
    
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return names
//        } else {
//            return names.filter { $0.contains(searchText) }
//        }
//    }
}
//----------------------------//


struct CourseDescription: Identifiable {
    var id = UUID()
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
    
    
}
let allCourseDescription: [CourseDescription] = [
    CourseDescription(image: "Coiffeur", title: "Coiffeur(se)", titleLoc : "CFA de la Chambre des métiers" ,description: "CAP métiers de la coiffure. CFA de la Chambre des métiers et de l'artisanat du Val de Marne 25 avenue Raspail 94100 Saint-Maur-des-Fossés Cedex - Académie de Créteil.", like: false, tel: "0149765030", mail: "", website: "www.cfa94.com", longitude: 48.786938170304396, latitude: 2.486971646029291),
    
    CourseDescription(image: "Coiffeur", title: "Coiffeur(se)", titleLoc : "EIC", description: "Niveau BAC : Brevet professionnel coiffure qui se prépare en un an après le CAP, en formation continue ou en apprentissage. Ecole internationale de coiffure (EIC) 45 rue de Montreuil, 11e arr. 75001 Paris - Académie de Paris", like: false, tel: "0142367015", mail: "contact@eic.paris", website: "www.eic.paris", longitude: 48.850723294840954, latitude: 2.388252327038557),
    
    CourseDescription(image: "Estheticienne", title: "Esthetitien(ne", titleLoc: "CFA Campus des métiers et de l'entreprise",description: "CAP esthétique - cosmétiques -  parfumerie : diplôme d’accès à la profession. CFA Campus des métiers et de l'entreprise 91-129 rue Edouard Renard 93013 Bobigny Cedex - Académie de Créteil", like: false, tel: "0141833838", mail: "campus@campus93.fr", website: "www.campus93.fr", longitude: 48.91457285165125, latitude: 2.415970098204654),
    
    CourseDescription(image: "Estheticienne", title: "Estheticien(ne)", titleLoc: "Ecole Silvya Terrade Paris",description: "Bac pro esthétique - cosmétiques -  parfumerie. Ecole Silvya Terrade Paris - Champs-Elysées 6 rue Paul Baudry, 8è arr. 75008 Paris - Académie de Paris", like: false, tel: "0142659977", mail: "contact-paris@silvya-terrade.com", website: "www.groupe-terrade.com/fr/ecoles/paris", longitude: 48.87224939925498, latitude: 2.3071697270392058),
    
    CourseDescription(image: "Pilote2", title: "Pilote de ligne", titleLoc: "ENAC Toulouse",description: "La voie militaire, accessible sur concours avec le BAC, qui implique de s’engager 10 ans dans l’armée de l’air. ENAC Toulouse 7 avenue edouard Belin CS 54005 31055 Toulouse Cedex 04 - Académie de Toulouse", like: false, tel: "0562174000", mail: "communication@enac.fr", website: "www.enac.fr", longitude: 43.56477240888034, latitude: 1.4783198845627117),
    
    CourseDescription(image: "Pilote2", title: "Pilote de ligne", titleLoc: "ENAC Montpellier",description: "2 ans pour se préparer au diplôme de l’ENAC (Ecole nationale de l’aviation civile). ENAC Montpellier Aeroport de Montpellier-Méditerrannée 34134 Maugio Cedex - Académie de Montpellier", like: false, tel: "0467206200", mail: "", website: "www.enac.fr/fr/montpellier", longitude: 43.57958329464592, latitude: 3.9523297403842133),
    
    CourseDescription(image: "Mecanoaero", title: "Mécanicien(ne) aéronautique", titleLoc: "Lycée professionnel Pierre Mendès France",description: "CAP aéronautique options : avionique, structure systèmes. Lycée professionnel Pierre Mendès France Avenue Yitzhak Rabin BP 17 13741 Vitrolles Cedex - Académie d'Aix-Marseille", like: false, tel: "0442898979", mail: "e.0133015G@ac-aix-marseille.fr", website: "www.lyc-mendesfrance-vitrolles.ac-aix-marselle.fr", longitude: 43.44674943290722, latitude: 5.247393484559595),
    
    CourseDescription(image: "Mecanoaero", title: "Mécanicien(ne) aéronautique", titleLoc: "CFA des métiers de l'aerien",description: "Bac pro aéronautique options : avionique, structure, systèmes. CFA des métiers de l'aerien rue de la piste 95500 Bonneuil-en-France - Académie de Versailles", like: false, tel: "0148162334", mail: "contact@cfa-afmae.fr", website: "www.afmae.fr", longitude: 48.96962441258092, latitude: 2.429014842385161),
    
    CourseDescription(image: "Architect", title: "Architecte d'intérieur", titleLoc: "Lycee ESAA Ecole Boulle",description: "BTS ERA (Etudes et réalisation d’agencement. Lycee-ESAA-Ecole Boulle 9 rue Pierre Bourdan 12e arr. 75571 Paris Cedex 12 - Académie de Paris", like: false, tel: "0144676967", mail: "ce.0750681H@ac-paris.fr", website: "www.ecole-boulle.org", longitude: 48.846815307732015, latitude: 2.391404296352271),
    
    CourseDescription(image: "Architect", title: "Architecte d'intérieur", titleLoc: "Lycee Léonard de Vinci", description: "DNA (Diplôme national d’art option design). Lycee Léonard de Vinci 20 rue de Bourseul, 15è arr. 75015 Paris - Académie de Paris", like: false, tel: "0153680525", mail: "ce.0754475G@ac-paris", website: "www.ac-paris.fr/serail/lyc-leonard-de-vinci", longitude: 48.838558533340915, latitude: 2.3022264270382324),
    
    CourseDescription(image: "Designer", title: "Dessinateur/trice projeteur", titleLoc: "Lycée de Prony", description: "Licence professionnelle métiers de l’industrie : conception de produits industriels. Lycée de Prony 4 rue de Bretagne 92600 Asnières-sur-Seine - Académie de Versailles", like: false, tel: "0147939417", mail: "0920150N@ac-versailles.fr", website: "www.lyc-prony-asnieres.ac-versailles.fr", longitude: 48.90436668142099, latitude: 2.284672769368633),
    
    CourseDescription(image: "Designer", title: "Dessinateur/trice projeteur", titleLoc: "Lycée Gustave Eiffel",description: "BTS AF (Aménagement finition). Lycée Gustave Eiffel 16 chemin de la Renardière 93220 Gagny - Académie de Créteil", like: false, tel: "0143028036", mail: "ce.0931272C@ac-creteil.fr", website: "www.eiffel-gagny.org", longitude: 48.88894175822161, latitude: 2.541402027039707),
    
    CourseDescription(image: "Dev", title: "Developpeur(se) iOS", titleLoc: "Simplon",description: "Centre de formation. Simplon 55 Rue de Vincennes, 93100 Montreuil", like: false, tel: "None", mail: "", website: "www.simplon.co", longitude: 48.85462510563048, latitude: 2.436042100053343),
    
    CourseDescription(image: "Dev", title: "Developpeur(se) iOS", titleLoc: "Epitech Paris",description: "Epitech Paris, École d'informatique. Epitech 24 Rue Pasteur, 94270 Le Kremlin-Bicêtre", like: false, tel: "0144080060", mail: "paris@epitech.eu", website: "www.epitech.eu/fr/ecole-informatique-paris/", longitude: 48.8177260577154, latitude: 2.363317016553528),
    
    CourseDescription(image: "CommunityManager", title: "Community Manager", titleLoc: "WIS - Web international school",description: "Licence information-communication. Web international school Paris (WIS) 20 bis jardins Boieldieu - La Défense 92071 Puteaux - Académie de Versailles", like: false, tel: "0155900630", mail: "paris@wis-ecoles.com", website: "www.wis-ecoles.com/campus/campus-de-paris", longitude: 48.88794377150883, latitude: 2.237733440532329),
    
    CourseDescription(image: "CommunityManager", title: "Community Manager", titleLoc: "CFA iA l'intelligence apprentie - campus de Nantes",description: "BTS MCO ( Management commercial opérationnel). CFA iA l'intelligence apprentie - campus de Nantes 3 boulevard du Bâtonnier Cholet CS 20323 44103 Nantes Cedex 04", like: false, tel: "0272568400", mail: "contact@ia-formation.fr", website: "www.intelligence-apprentie.fr", longitude: 47.19907620234098, latitude: -1.6079385054905586),
    
    CourseDescription(image: "Electromecano", title: "Electromécanicien(ne)", titleLoc: "Lycée Edouard Branly",description: "Bac pro Maintenance des systèmes de production connectés. Lycée Edouard Branly 33 rue du Petit Bois 94000 Créteil - Académie de Créteil", like: false, tel: "0143393475", mail: "ce.0941018W@ac-creteil.fr", website: "www.branlycreteil.free.fr/", longitude: 48.78426822481608, latitude: 2.4673003694240325),
    
    CourseDescription(image: "Electromecano", title: "Electromécanicien(ne)", titleLoc: "CFI Campus Paris",description: "BTS Électrotechnique. CFA L'EA-CFI- Campus Paris Gambetta 247 avenue Gambetta, 20e arr. 75020 Paris - Académie de Paris", like: false, tel: "0140314600", mail: "promotion-paris@ecole-lea.fr", website: "www.ecole-lea.fr", longitude: 48.86416373241934, latitude: 2.3914816289509653),
    
    CourseDescription(image: "Mecano", title: "Meanicien réparateur", titleLoc: "Lycée Camille Jenatzy",description: "CAP maintenance des véhicules. Lycée Camille Jenatzy 6 Rue Charles Hermite, 75018 Paris - Académie de Paris", like: false, tel: "0140378540", mail: "", website: "www.ac-paris.fr/serail/jcms/s2_1810047/fr/lycee-camille-jenatzy-mecanique-et-logistique", longitude: 48.90030753836802, latitude: 2.368570917131006),
    
    CourseDescription(image: "Mecano", title: "Meanicien réparateur", titleLoc: "ISAE‑Supméca – Institut Supérieur de Mécanique de Paris",description: "Bac pro Maintenance des véhicules. ISAE‑Supméca – Institut Supérieur de Mécanique de Paris 3 rue Fernand Hainaut 93407 Saint-Ouen-sur-Seine Cedex", like: false, tel: "0149452900", mail: "", website: "www.isae-supmeca.fr", longitude: 48.919755381792015, latitude: 2.332588655936224),
    
    CourseDescription(image: "VendeurExport", title: "Vendeur(se) export", titleLoc: "ESVE - Ecole supérieur de vente et d'exportation",description: "BTS CI (Commerce International). ESVE - Ecole supérieur de vente et d'exportation 7-11 Av. des Chasseurs, 75017 Paris", like: false, tel: "0188325382", mail: "admissions@esve-paris.com", website: "www.esve-paris.com", longitude: 48.88718752010701, latitude: 2.306068211754925),
    
    CourseDescription(image: "VendeurExport", title: "Vendeur(se) export", titleLoc: "Campus Montsouris (Cerfal)",description: "Licence professionnelle métier du commerce international. Campus Montsouris (Cerfal) 2 rue Lacaze, 14e arr. 75014 Paris", like: false, tel: "0140522870", mail: "contact@campusmontsouris.fr", website: "www.campusmontsouris.fr", longitude: 48.82506691171879, latitude: 2.3311298559334315),
    
    CourseDescription(image: "eCRM", title: "Chef(fe) de projet e-CRM", titleLoc: "PPA Business School",description: "Licence professionnelle métiers de l’informatique (BAC+3). PPA Business School 28-32 Rue de l'Amiral Mouchez, 75014 Paris", like: false, tel: "0140799390", mail: "admissions@ppa.fr", website: "www.ppa.fr", longitude: 48.82456813085689, latitude: 2.341310355933415),
    
    CourseDescription(image: "eCRM", title: "Chef(fe) de projet e-CRM", titleLoc: "ECITV", description: "Diplôme écoles de commerce et de gestion spécialisation marketing, d’école de communication (Bac+5). Ecitv 273 Rue de Vaugirard, 75015 Paris", like: false, tel: "0178966832", mail: "admissions@ecitv.fr", website: "www.ecitv.fr", longitude: 48.83985012933513, latitude: 2.302426527097811)
]
//----------------------------//

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .previewInterfaceOrientation(.portrait)
    }
}
