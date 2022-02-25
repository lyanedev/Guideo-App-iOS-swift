//
//  MotherView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .pageOnboarding
}

enum Page {
    case pageOnboarding
    case pageQuizz
    case pageDashboard
    case pageMap
}

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject private var categoriesTest = TestQuizz()
    var body: some View {
        switch viewRouter.currentPage {
        case .pageOnboarding:
            OnboardingView()
            
        case .pageQuizz:
            QuizzView(categoriesTest: categoriesTest)
                .transition(.scale)
        case .pageDashboard:
            DashboardApp()
        case .pageMap:
            MapView()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
            .environmentObject(ViewRouter())
    }
}
