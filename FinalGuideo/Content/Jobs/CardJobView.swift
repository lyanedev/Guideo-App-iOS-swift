//
//  CardJobView.swift
//  FinalGuideo
//
//  Created by Lyane Lamara on 08/02/2022.
//

import SwiftUI


struct CardJobView: View {
    @State private var isButtonClicked: Bool = false
    @StateObject private var viewModel = StructsMap()

        var id = UUID()
        var image: String
        var title: String
        var like: Bool
        var description: String
        var title2: String
        var course1: String
        var course2: String
    
    var body: some View {
        VStack{
            ScrollView {
            Image(image)
                    .resizable()
                    .frame(height: 160.0)
                    .zIndex(1)
                    .ignoresSafeArea(.all)

            HStack {
                Text(title)
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
                    
            
            Text("Parcours")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("categoryBlue"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
                CustomCourseButton(title: course1, subtitle: course2)
                CustomCourseButton(title: course2, subtitle: course2)
                    .padding(.bottom, 100.0)
                }
            
        }
        }
    }
struct ExtractedView: View {
    
    let title : String
    let subtitle : String
    
    
    var body: some View {
        Button(action: {
            print("")
        }, label: {
            VStack{
            Text(title)
                    .font(.system(size: 18))
            Text(subtitle)
                    .font(.system(size: 15))
            }
            .frame(width: 370, height: 50)
            .background(Color(red: 49/255, green: 167/255, blue: 124/255))
            .cornerRadius(20)
            .foregroundColor(Color.white)
            
        })
    }
}

struct CustomCourseButton: View {
    
    let title : String
    let subtitle : String
    
    
    var body: some View {
        Button(action: {
            print("")
        }, label: {
            ZStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                    Text(title)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding(.leading, 30.0)
                    Text(subtitle)
                            .font(.system(size: 15))
                            .padding(.leading, 30.0)
                    }
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill")
                        .padding(.trailing, 10.0)
                        .font(.system(size: 30))
                        
                }
                .frame(width: 370, height: 50)
                .background(Color("primaryBlue"))
                .cornerRadius(40)
                .foregroundColor(Color.white)
            }
            
        })
    }
}


struct CardJobView_Previews: PreviewProvider {
    static var previews: some View {
        CardJobView(image: "", title: "", like: false, description: "", title2: "", course1: "", course2: "")
    }
}
