//
//  QuizzStructs.swift
//  FinalGuideo
//
//  Created by Apprenant 81 on 08/02/2022.
//

import SwiftUI

class QuizzOption : Identifiable, ObservableObject {
    var id = UUID()
    var quest: String
    var userResponse: Bool
    var page: Int
   @Published var categories: [Categories]
    
    init(quest: String, userResponse: Bool, page: Int, categories: [Categories]) {
        self.page = page
        self.categories = categories
        self.quest = quest
        self.userResponse = userResponse
    }
}

class TestQuizz: ObservableObject {
@Published var allQuizz: [QuizzOption] = [
    QuizzOption(quest: "Le salaire est très important pour moi", userResponse: false, page: 1, categories: [allCategories[1], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "Je prefère travailler a mon compte", userResponse: false, page: 2, categories: [allCategories[0], allCategories[3], allCategories[4]]),
    QuizzOption(quest: "J'aime accomplir des tâches administratives", userResponse: false, page: 3, categories: [allCategories[5]]),
    QuizzOption(quest: "J'aime voyager pour mon travail", userResponse: false, page: 4, categories: [allCategories[1], allCategories[5]]),
    QuizzOption(quest: "J'aime le contact avec les gens", userResponse: false, page: 5, categories: [allCategories[0], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "J'aime les nouvelles technologies", userResponse: false, page: 6, categories: [allCategories[1], allCategories[3], allCategories[4]]),
    QuizzOption(quest: "Je suis perfectionniste et persévérant(e)", userResponse: false, page: 7, categories: [allCategories[1], allCategories[2], allCategories[3], allCategories[4]]),
    QuizzOption(quest: "Je suis curieux(se) et imaginatif(ve)", userResponse: false, page: 8, categories: [allCategories[0], allCategories[2], allCategories[3]]),
    QuizzOption(quest: "Je suis organisé(e) et critique", userResponse: false, page: 9, categories: [allCategories[1], allCategories[2], allCategories[3], allCategories[4]]),
    QuizzOption(quest: "Je suis patient(e) et attentif(ve)", userResponse: false, page: 10, categories: [allCategories[0], allCategories[1], allCategories[2], allCategories[3],allCategories[4], allCategories[5]]),
    QuizzOption(quest: "Je suis d'esprit independant et sûr(e) de soi", userResponse: false, page: 11, categories: [allCategories[1], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "Je suis serviable et consciencieux(se)", userResponse: false, page: 12, categories: [allCategories[4], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "Je suis ambitieux(se) et objectif(ve)", userResponse: false, page: 13, categories: [allCategories[1], allCategories[2], allCategories[5]]),
    QuizzOption(quest: "L'activité artistique m'attire", userResponse: false, page: 14, categories: [allCategories[1], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "J'aime travailler dans un bureau?", userResponse: false, page: 15, categories: [allCategories[2], allCategories[3], allCategories[5]]),
    QuizzOption(quest: "J'aime diriger et organiser le travail d'une équipe", userResponse: false, page: 16, categories: [allCategories[1], allCategories[3], allCategories[5], allCategories[4]]),
    QuizzOption(quest: "Je pratique régulièrement une activité manuelle", userResponse: false, page: 17, categories: [allCategories[0], allCategories[4], allCategories[2]]),
    QuizzOption(quest: "Je suis communicatif(ve) et concret(e)", userResponse: false, page: 18, categories: [allCategories[0], allCategories[1], allCategories[2], allCategories[3],allCategories[4], allCategories[5]]),
]
}

//---------------------------------//

class Categories : Identifiable, ObservableObject {
    var id = UUID()
    var text: String
   @Published var score: Int
    
    init(text: String, score: Int){
        self.text = text
        self.score = score
    }
}

var allCategories: [Categories] = [
    Categories(text: "Esthetique", score: 0),
    Categories(text: "Aéronautique", score: 0),
    Categories(text: "Architecture", score: 0),
    Categories(text: "Informatique", score: 0),
    Categories(text: "Mécanique", score: 0),
    Categories(text: "Commerce", score: 0)
]


