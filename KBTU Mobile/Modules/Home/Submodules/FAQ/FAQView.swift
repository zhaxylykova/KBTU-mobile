//
//  FAQView.swift
//  kbtu-mob
//
//  Created by Altynay on 06.04.2023.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
//        NavigationView{
            VStack(spacing: 20){
                // добавить поиск
                HStack(spacing: 5){
                    VStack(alignment: .leading, spacing: 20){
                        NavigationLink(destination: QAView()){
                            VStack(alignment: .leading){
                                Text("Study info")
                                    .font(.title)
                                    .foregroundColor(Color("darkPurple"))
                                Text("how to register, how to add/drop courses, etc.").foregroundColor(Color("darkPurple 1"))
                                            }
                                    .padding()
                                    .frame(width: 180, height: 150)
                                    .background(Color("lightOrange"))
                                    .cornerRadius(15)
                                    .multilineTextAlignment(.leading)
                        }//navlink closed
                        
                        NavigationLink(destination: InfoView()){
                            VStack(alignment: .leading){
                                Text("Academic Mobility Info")
                                    .font(.title)
                                    .foregroundColor(Color("darkPurple"))
                                Text("which countries, the deadlines, scholarships/grants, etc.")
                                    .foregroundColor(Color("darkPurple 1"))
                            }
                                    .padding()
                                    .frame(width: 170, height: 280)
                                    .background(Color("Blue"))
                                    .cornerRadius(15)
                                    .multilineTextAlignment(.leading)
                        }//navlink closed
                    } // vstack closed
                    VStack(alignment: .trailing, spacing: 20){
                        NavigationLink(destination: InfoView()){
                            VStack(alignment: .leading){
                                Text("Payment Info")
                                    .font(.title)
                                    .foregroundColor(Color("darkPurple"))
                                Text("cost of credits, cost of education, how to pay for services, etc.")
                                    .foregroundColor(Color("darkPurple 1"))
                            }
                            .padding()
                            .frame(width: 170, height: 280)
                            .background(Color("Green"))
                            .cornerRadius(15)
                            .multilineTextAlignment(.leading)
                        }//navlink closed

                        NavigationLink(destination: InfoView()){
                            VStack(alignment: .leading){
                                Text("Accomodation info")
                                    .font(.title)
                                    .foregroundColor(Color("darkPurple"))
                                Text("dormitory cost, etc.").foregroundColor(Color("darkPurple 1"))
                                            }
                                    .padding()
                                    .frame(width: 210, height: 150)
                                    .background(Color("White"))
                                    .cornerRadius(15)
                                    .multilineTextAlignment(.leading)
                        }//navlink closed
                    } // vstack closed
                //    .padding(.trailing,60)
                }//hstack closed
                NavigationLink(destination: InfoView()){
                    VStack(alignment: .leading){
                        Text("Other")
                            .font(.title)
                            .foregroundColor(Color("darkPurple"))
                        Text("on-campus jobs, onay card, etc.").foregroundColor(Color("darkPurple 1"))
                                    }
                            .padding()
                            .frame(width: 400, height: 150)
                            .background(Color("purpleColor"))
                            .cornerRadius(15)
                            .multilineTextAlignment(.leading)
                }//navlink closed
                
                Spacer()
            } //vstack closed
            .padding(30)
            .navigationTitle("FAQ")
            .background(Color("backgroundColor"))
        } // nav closed
        
//    }
}


struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
