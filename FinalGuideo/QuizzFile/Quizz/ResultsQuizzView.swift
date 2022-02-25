//
//  ResultsQuizzView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct ResultsQuizzView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var categoriesTest: TestQuizz
    @Binding var newBool: Bool
    
    var body: some View {
        
        ZStack{
            Color(red: 0.455, green: 0.549, blue: 0.671)
                .ignoresSafeArea()
            VStack{
                VStack(alignment: .leading, spacing: 18){
                    Spacer()
                    ContentResultTextView()
                    Spacer()
                }
                ScrollViewReader{ scrollView in
                    ScrollView(showsIndicators: false){
                    
                        VStack(alignment: .leading, spacing: 10){
                            
                            ForEach(categoriesTest.allQuizz){ test in
                                ForEach(test.categories.sorted(by: { $0.score > $1.score })) { category in
                                    HStack{
                                        
//                                    CategoriesResultView(text: category.text, customColor: Color(red: 120/255, green: 90/255, blue: 30/255))
//                                        Text("\(category.score)")
                                        
                                        ProgressView(category.text, value: Double(category.score), total: 14)
                                            .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                                        
                                    }.id(test.id)
                                }
                            }.onAppear{
                                scrollView.scrollTo(categoriesTest.allQuizz.last?.id, anchor: .top)
                            }
                            
                            //PieChart(title: "", data: chartDataSet, separatorColor: Color(UIColor.systemBackground), accentColors: pieColors)
                            
                        }.frame(width: 300, alignment: .leading)
                }
                }.frame(height: 230)
                VStack{
                    Spacer()
                    Spacer()
                    Button(action: {
                        viewRouter.currentPage = .pageDashboard
                    }) {
                        StartButtonView(text: "Continuer")
                    }
                    Spacer()
                    //                    HStack(alignment: .center,spacing: 0){
                    //                        Spacer()
                    //                        Button(action: {
                    //                            newBool.toggle()
                    //                        }){
                    //                            Text("Refaire le Quiz")
                    //                                .bold()
                    //                                .padding(.horizontal, 42.0)
                    //                                .padding(.vertical, 15.0)
                    //                                .font(.system(size: 20))
                    //                                .overlay(
                    //                                    RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 2)
                    //                                )
                    //
                    //
                    //                        }.padding()
                    //
                    //
                    //                        Spacer()
                    //                    }
                }.frame(height: 150)
                
            }.padding(.horizontal, 45.0)
            
        }.foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .environmentObject(ViewRouter())
    }
    
}
struct CategoriesResultView: View{
    var text: String = ""
    var customColor: Color
    
    var body: some View {
        
        Text(text)
            .bold()
            .padding(.horizontal, 20.0)
            .padding(.vertical, 8.0)
            .foregroundColor(.white)
            .background(customColor)
            .cornerRadius(30)
        
        
    }
}
struct ContentResultTextView: View{
    var body: some View {
        Text("Bien joue!")
            .fontWeight(.bold)
            .font(.system(size: 60))
        
        Spacer()
        Text("D'après tes résultats, voici les suggestions de catégories de métiers recommandé pour ton profil.")
            .frame(height: 70)
        
    }
}

struct ResultsQuizzView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsQuizzView(categoriesTest: TestQuizz(), newBool: .constant(false))
    }
}
