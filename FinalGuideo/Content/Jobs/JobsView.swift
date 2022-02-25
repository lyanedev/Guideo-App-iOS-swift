//
//  JobsView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct JobsView: View {
    
    @State private var searchText = ""
    let names = ["Pilote de ligne", "Mécanicien", "Coiffeur", "Ingénieur", "Exemple", "Testeur de fromages"]
    var gridItems: [GridItem] = [GridItem(.fixed(150)),
                                 GridItem(.fixed(150))]
    
    var customBlue = Color(red: 47/255, green: 48/255, blue: 71/255)
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItems, alignment: .center) {
                    ForEach(allJobStruct) { values in
                        VStack {
                            NavigationLink(destination: CardJobView(image: values.image, title: values.title, like: values.like, description: values.description, title2: values.title2, course1: values.course1, course2: values.course2)) {
                                
                                ZStack {
                                    
                                    Image(values.image)
                                        .resizable()
                                        .frame(width: 170, height: 150, alignment: .center)
                                        .cornerRadius(20)
                                        .scaledToFit()
                                        .shadow(color: Color("primaryBlue"), radius: 5, x: 0, y: 5)
                                        
                                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.black.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(20)
                                            .frame(width: 170, height: 150, alignment: .bottom)
                                        
                                        Text(values.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.headline)
                                            .frame(width: 173, height: 185, alignment: .bottom)
                                            .padding([.leading, .bottom, .trailing], 50.0)
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
            .navigationBarTitle(Text("Métiers"), displayMode: .inline)
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
//---------//
struct CardJobStruct: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

let allCardJob:[CardJobStruct] = [
    CardJobStruct(title: "Coiffeur", image: "String"),
    CardJobStruct(title: "Esthéticienne", image: "String"),
    CardJobStruct(title: "Pilote de ligne", image: "String"),
    CardJobStruct(title: "Mécanicien aéronautique", image: "String"),
    CardJobStruct(title: "Architecte d'interieur", image: "String"),
    CardJobStruct(title: "Dessinateur projeteur", image: "String"),
    CardJobStruct(title: "Développeur IOS", image: "String"),
    CardJobStruct(title: "Community Manager", image: "String"),
    CardJobStruct(title: "Électromécanicien", image: "String"),
    CardJobStruct(title: "Mécanicien réparateur", image: "String"),
    CardJobStruct(title: "Vendeur export", image: "String"),
    CardJobStruct(title: "Chef de projet e-CRM", image: "String")
]

struct JobStruct: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var like: Bool
    var description: String
    var title2: String
    var course1: String
    var course2: String
}

let allJobStruct: [JobStruct] = [
    JobStruct(image: "Coiffeur", title: "Coiffeur(se)", like: false, description: "Le coiffeur ou la coiffeuse assure l'ensemble des soins esthétiques et hygiéniques de la chevelure. Aux soins courants comme le shampooing, la coupe et le brushing… Il peut travailler dans un salon de coiffure, à son domicile ou chez son client. Le salaire d’un(e) coiffeur(se) mensuel brut peut s'élever à 1 800 €.", title2: "Parcours:", course1: "CFA de la Chambre de métiers et de l'artisanat du Val de Marne", course2: "Ecole internationale de coiffure (EIC)"),
    
    JobStruct(image: "Estheticienne", title: "Esthéticien(ne)", like: false, description: "L'esthéticien ou l'esthéticienne est un professionnel spécialiste de la peau, des cosmétiques, des techniques de soins, de modelages esthétiques, de manucure, de maquillages et d'épilation. Le salaire est compris entre 849 € bruts et 3 054 € bruts par mois soit un salaire moyen de 1 729 € bruts par mois.", title2: "Parcours", course1: "CFA Campus des métiers et de l'entreprise", course2: "Ecole Silvya Terrade Paris - Champs-Elysées"),
    
    JobStruct(image: "Pilote2", title: "Pilote de ligne", like: false, description: "Le pilote de ligne a la responsabilité d'assurer le transport, en avion, des passagers, ce qui exige un équilibre nerveux et physique à toute épreuve, mais également une grande présence d'esprit pour maîtriser les imprévus : brouillard, turbulences, espace aérien encombré, etc. Le salaire à l’embauche d’un pilote de ligne débutant est estimé à 4 000 euros bruts mensuels s’il réussit à se faire recruter par une compagnie nationale. En low-cost le pilote peut espérer un salaire global de 2 300 euros à 2 800 euros mensuels nets.", title2: "Parcours", course1: "ENAC Toulouse", course2: "ENAC Montpellier"),
    
    JobStruct(image: "Mecanoaero", title: "Mecanicien(ne) aéronautique", like: false, description: "Le mécanicien avion ou mécanicien de maintenance aéronautique démonte et vérifie l'état et la conformité des pièces de l'avion (systèmes mécaniques, électriques, hydrauliques, équipements, ..). Accessible avec le CAP aéronautique options : avionique, structure systèmes ou Bac pro aéronautique options : avionique, structure, systèmes. Le débutant gagne entre 1 600 et 1 700 € net mensuels. S'il est chef d'équipe entre 1 900 et 2 500 € net.", title2: "Parcours:", course1: "Lycée professionnel Pierre Mendès France", course2: "CFA des métiers de l'aerien"),
    
    JobStruct(image: "Architect", title: "Architecte d'intérieur", like: false, description: "L'architecte d'intérieur conçoit et réalise l'aménagement d'espaces intérieurs (cloisons, mobilier, éclairage, sens de la circulation dans les bâtiments...). Le salaire est une moyenne d’environ 2 700 € par mois.", title2: "Parcours:", course1: "Lycee-ESAA-Ecole Boulle", course2: "Lycee Léonard de Vinci"),
    
    JobStruct(image: "Designer", title: "Dessinateur/trice-projeteur", like: false, description: "Le dessinateur ou dessinatrice-projeteur concrétise, sur écran, le projet né dans la tête d'un architecte, via des plans et des schémas tout en y intégrant les calculs effectués par les ingénieurs d'études. Il fait le lien entre la conception et la réalisation. Le salaire est d’une moyenne d’environ 2 815 € bruts par mois.", title2: "Parcours:", course1: "Lycée de Prony", course2: "Lycée Gustave Eiffel"),
    
    JobStruct(image: "Dev", title: "Developpeur(se) iOS", like: false, description: "Le développeur iOS est un ingénieur spécialisé dans le développement mobile autour des technologies et produits Apple (iPhone, iPad etc.). Les projets sur lesquels il intervient peuvent consister à programmer l’équivalent mobile d’une application web, ou bien à réaliser une application à partir de zéro. Le salaire moyen d’un développeur iOS débutant est situé entre 3500 € et 3750 €. Son salaire évoluera en même temps que son expérience.", title2: "Parcours:", course1: "Simplon", course2: "Epitech"),
    
    JobStruct(image: "CommunityManager", title: "Community Manager", like: false, description: "Le community manager (animateur de communautés web) travaille principalement en agence, mais aussi pour un annonceur, une entreprise, un site web... Il réalise l'animation d'un site multimédia (forum, chat, jeu, vente, emploi, administration, ...) et le suivi des relations et des échanges avec les clients, les internautes. Le salaire est de 2 000 € brut par mois en moyenne pour un community manager débutant. La rémunération augmente rapidement.", title2: "Parcours:", course1: "Web international school Paris (WIS)", course2: "CFA iA l'intelligence apprentie - campus de Nantes"),
    
    JobStruct(image: "", title: "Electromécanicien(ne)", like: false, description: "L'électromécanicien installe les machines neuves d'un atelier ou d'un chantier : machines de production, engins de levage... En s'appuyant sur le dossier de fabrication, il assure le montage des moteurs, roulements ou variateurs de vitesse, et établit les connexions électriques. Le salaire moyen d’un électromécanicien est de 1 800 € brut en début de carrière. ", title2: "Parcours:", course1: "Lycée Edouard Branly", course2: "CFA L'EA-CFI- Campus Paris Gambetta"),
    
    JobStruct(image: "", title: "Mécanicien(ne) réparateur", like: false, description: "Le mécanicien réparateur ou la mécanicienne réparatrice est un(e) technicien(ne) d'atelier qui assure l'entretien, la maintenance (prévention des pannes), la réparation et le réglage des véhicules automobiles. Le salaire d’un mécanicien varie entre 1568€ brut par mois à 1.963€ brut.", title2: "Parcours:", course1: "Lycée Camille Jenatzy", course2: "ISAE-Supméca Institut Superieur de Mecanique de Paris"),
    
    JobStruct(image: "", title: "Vendeur(se) export", like: false, description: "Le vendeur export / la vendeuse export est chargé(e) de démarcher des clients étrangers, utilisateurs ou revendeurs. Son objectif : vendre le plus possible et à prix dans sa zone géographique les produits ou les services de l'entreprise qu'il représente. Le salaire est en moyenne de 2 700 € brut par mois pour un débutant avec en plus des primes de résultat.", title2: "Parcours:", course1: "ESVE - Ecole supérieur de vente et d'exportation", course2: "Campus Montsouris (Cerfal)"),
    
    JobStruct(image: "", title: "Chef(fe) de projet e-CRM", like: false, description: "Le chef de projet e-CRM (electronic customer relationship management). Il assure le marketing relationnel pour l’ensemble des plateformes numériques d’une entreprise et met en œuvre des campagnes de gestion de la relation client destinées au web. Le salaire est d’environ 2 200 euros bruts par mois.", title2: "Parcours:", course1: "PPA Business School", course2: "Ecitv")
]
//----------//

struct JobsView_Previews: PreviewProvider {
    static var previews: some View {
        JobsView()
            .previewInterfaceOrientation(.portrait)
    }
}
