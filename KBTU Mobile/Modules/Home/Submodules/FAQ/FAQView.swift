//
//  FAQView.swift
//  kbtu-mob
//
//  Created by Altynay on 06.04.2023.
//

import SwiftUI

struct FAQView: View {
    @ObservedObject var viewModel = FAQViewModel(firestoreService: FirestoreServiceNew())
    
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 20){
                if let items = viewModel.items {
                    // добавить поиск
                    HStack(spacing: 0){
                        VStack(alignment: .leading, spacing: 20){
                            NavigationLink(destination: QAView(item: items[0])) {
                                VStack(alignment: .leading){
                                    Text(items[0].title ?? "")
                                        .font(.title)
                                        .foregroundColor(Color("darkPurple"))
                                    Text(items[0].description ?? "").foregroundColor(Color("darkPurple 1"))
                                }
                                .padding()
                                .frame(width: 180, height: 150)
                                .background(Color("lightOrange"))
                                .cornerRadius(15)
                                .multilineTextAlignment(.leading)
                            }//navlink closed
                            
                            NavigationLink(destination: QAView(item: items[1])) {
                                VStack(alignment: .leading){
                                    Text(items[1].title ?? "")
                                        .font(.title)
                                        .foregroundColor(Color("darkPurple"))
                                    Text(items[1].description ?? "")
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
                            NavigationLink(destination: QAView(item: items[2])) {
                                VStack(alignment: .leading){
                                    Text(items[2].title ?? "")
                                        .font(.title)
                                        .foregroundColor(Color("darkPurple"))
                                    Text(items[2].description ?? "")
                                        .foregroundColor(Color("darkPurple 1"))
                                }
                                .padding()
                                .frame(width: 170, height: 280)
                                .background(Color("Green"))
                                .cornerRadius(15)
                                .multilineTextAlignment(.leading)
                            }//navlink closed
                            
                            NavigationLink(destination: QAView(item: items[3])) {
                                VStack(alignment: .leading){
                                    Text(items[3].title ?? "")
                                        .font(.title2)
                                        .foregroundColor(Color("darkPurple"))
                                    Text(items[3].description ?? "").foregroundColor(Color("darkPurple 1"))
                                }
                                .padding()
                                .frame(width: 180, height: 150)
                                .background(Color("White"))
                                .cornerRadius(15)
                                .multilineTextAlignment(.leading)
                            }//navlink closed
                        } // vstack closed
                        //    .padding(.trailing,60)
                    }//hstack closed
                    NavigationLink(destination: QAView(item: items[4])) {
                        VStack(alignment: .leading){
                            Text(items[4].title ?? "")
                                .font(.title)
                                .foregroundColor(Color("darkPurple"))
                            Text(items[4].description ?? "").foregroundColor(Color("darkPurple 1"))
                        }
                        .padding()
                        .frame(width: 360, height: 150)
                        .background(Color("purpleColor"))
                        .cornerRadius(15)
                        .multilineTextAlignment(.leading)
                    }//navlink closed
                    Spacer()
                }
            } //vstack closed
            .padding(30)
            .navigationTitle("FAQ")
        } // nav closed
    }
}


struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
