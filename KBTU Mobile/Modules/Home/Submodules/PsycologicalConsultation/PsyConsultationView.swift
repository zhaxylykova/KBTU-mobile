//
//  PsyConsultationView.swift
//  kbtu-mob
//
//  Created by Altynay on 17.03.2023.
//

import SwiftUI

struct PsyConsultationView: View {
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack (alignment: .center) {
                    Text("Psychological consultation")
                        .font(.system(size:30, weight: .bold))
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 90, alignment: .center)
                    Text("You can get expert advice, psychological assistance ans support in resolving difficult issues and difficult life situations, assistance in personal growth, development and self-realization.")
                        .multilineTextAlignment(.leading)
                        .frame(width: 400, height: 110)
                        .font(.system(size: 18))
                }// Vstack closed
                Button{
                    if let url = URL(string: "https://kbtu.edu.kz/ru/students/psikholog") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                } label: {
                    Label("Make an appointment",systemImage: "arrow.up.right.square.fill")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("darkPurple"))
                        .padding(30)
                        .frame(width: 400, height: 60, alignment: .center)
                }
                Button{print ("click")}
            label: {
                Label("Take the psychological test",systemImage: "arrow.up.right.square.fill")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("darkPurple"))
                    .padding(30)
                    .frame(width: 450, height: 60, alignment: .center)
            }
                HStack {
                    Text("you can take a psychological test to get to know yourself better")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading], 40)
                        .padding([.trailing], 5)
                    VStack{
                        Text("to do so:")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Label("click the link above", systemImage: "1.circle.fill")
                            .frame(width: 200, height: 30, alignment: .leading)
                        Label("answer the questions yes or no", systemImage: "2.circle.fill")
                            .frame(width: 200, height: 50, alignment: .leading)
                        Label("wait for the results", systemImage: "3.circle.fill")
                            .frame(width: 200, height: 30, alignment: .leading)
                    } // vstack closed
                    .padding([.trailing], 40)
                    .padding([.leading], 10)
                }//hstack closed
                .frame(height: 200)
                .background(in: Rectangle())
                .colorMultiply(/*@START_MENU_TOKEN@*/Color("purpleColor")/*@END_MENU_TOKEN@*/)
                .padding([.top, .bottom], 20)
                HStack {
                    Text("you can also contact the university psychologist:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading], 40)
                        .padding([.trailing], 5)
                    VStack{
                        Label("click the link above", systemImage: "1.circle.fill")
                            .frame(width: 200, height: 30, alignment: .leading)
                        Label("answer the questions yes or no", systemImage: "2.circle.fill")
                            .frame(width: 200, height: 50, alignment: .leading)
                        Label("wait for the results", systemImage: "3.circle.fill")
                            .frame(width: 200, height: 30, alignment: .leading)
                    } // vstack closed
                    .padding([.trailing], 40)
                    .padding([.leading], 10)
                }//hstack closed
                .frame(height: 200)
                .background(in: Rectangle())
                .colorMultiply(/*@START_MENU_TOKEN@*/Color("purpleColor")/*@END_MENU_TOKEN@*/)
            } // scroll view closed
        }//zstack closed
    }
}

struct PsyConsultationView_Previews: PreviewProvider {
    static var previews: some View {
        PsyConsultationView()
    }
}
