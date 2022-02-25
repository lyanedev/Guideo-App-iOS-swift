//
//  QuizzView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI

struct QuizzView: View {
    
    @State private var index: Int = 0
    @State private var categoryScore: Int = 0
//    @ObservedObject var test: QuizzOption
    @ObservedObject var categoriesTest: TestQuizz
    @State private var finalClick = false
    //@ObservedObject var categories: Categories
    
//    var quizzOption: QuizzOption
//    var categories: Categories
    @State var doitValider = false
    
    // --------- fonction Quizz -----------------
    func onClick() {
        
        if true {
            for indexT in 0...categoriesTest.allQuizz[index].categories.count-1 {
                categoriesTest.allQuizz[index].categories[indexT].score += 1
//                print(categoriesTest.allQuizz[index].categories[indexT].score)
                //print("--", )
            }
        }
        if categoriesTest.allQuizz[index].page == 18 {
            
            finalClick = true
        }else{
            index += 1
        }
    }
    
    
    
    var body: some View {
        ZStack{
            Color("primaryBlue")
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0){
                Spacer(minLength: 50)
                TitleView()
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 50)
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack{
//                        Text(categoriesTest.allQuizz[0].score)
                        
                        Spacer(minLength: 10)
                        
                        if !finalClick {
                        Text("\(categoriesTest.allQuizz[index].page) / 18")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)}
                    }
                    VStack(alignment: .center, spacing: 0) {
                        
                        ZStack {
                            
                            if !finalClick {
                            Color.white
                                .frame(width: 250, height: 170)
                                .cornerRadius(30, corners: .topLeft)
                                .cornerRadius(30, corners: .topRight)}
                            
                            if finalClick {
                                Text("Quizz terminé! 🎉")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 200)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 90)
                                    .padding(.bottom, 120)
                            } else {
                                
                                Text(categoriesTest.allQuizz[index].quest)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(width: 200)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 90)
                            }
                            
                        }
                        

                        HStack(alignment: .center, spacing: 0){
                            ZStack {
                                
                                if !finalClick {
                                HStack(spacing: 0) {
                                    Color("customGreen")
                                        .frame(width: 125, height: 60)
                                        .cornerRadius(30, corners: .bottomLeft)
                                    Color("customRed")
                                        .frame(width: 125, height: 60)
                                        .cornerRadius(30, corners: .bottomRight)
                                }}
                                
                                if !finalClick {
                                HStack(spacing: 70) {
                                    
                                    Button {
                                        
                                        onClick()
                                        
                                        
    
                                                  
                                    } label: {
                                        Image(systemName: "hand.thumbsup")
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }.disabled(finalClick ? true : false)
                                    
                                    
                                    Button {
                                        if categoriesTest.allQuizz[index].page == 18 {
                                            finalClick = true
                                        }else{
                                            index += 1
                                        }
                                        
                                        
                                    } label: {
                                        Image(systemName: "hand.thumbsdown")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .padding(.leading)
                                    }.disabled(finalClick ? true : false)
                                    
                                }}
                            }
                        }
                        
                    }
                }
                VStack{
                    Spacer(minLength: 90)
                    if finalClick {
                        Button {
                            doitValider.toggle()
                            //print("--",categoriesTest.allQuizz[index].categories[index].score)
                        } label: {
                            StartButtonView(text: "Passer aux résultats!")
                        }.sheet(isPresented: $doitValider, content: {
                            ResultsQuizzView(categoriesTest: TestQuizz(), newBool: $doitValider)})
                        
                        
                    } else {
                        EmptyView()
                    }
                    
                    
                }.padding(.horizontal, 20)
            }
        }
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView(categoriesTest: TestQuizz())
    }
}

