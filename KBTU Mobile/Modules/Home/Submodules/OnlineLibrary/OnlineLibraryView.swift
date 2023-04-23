//
//  OnlineLibraryView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 04.03.2023.
//

import SwiftUI

struct OnlineLibraryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("The research library database provides a list of available databases with a detailed description.")
                    .font(.title3)
                    //.padding()
                Text("All you have to do is to:")
                    .font(.title2)
                    .fontWeight(.semibold)
    
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "01.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(.systemPurple))
                        Text("login using your KBTU credentials")
                            .font(.title3)
                    }
                    HStack {
                        Image(systemName: "02.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(.systemPurple))
                        Text("choose the necessary database")
                            .font(.title3)
                    }
                    HStack {
                        Image(systemName: "03.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(.systemPurple))
                        Text("search for a document/book")
                            .font(.title3)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color("lightpurpleColor"))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            //.padding(30)
            
            if let url = URL(string: "https://dbsl.kbtu.kz/") {
                HStack {
                    Link(destination: url) {
                        Label (
                            title: {
                                Text("Research Library Database")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                            },
                            icon: {
                                Image(systemName: "arrow.right")
                            }
                        )
                    }

                }
            }

            Image("libraryImage")
                .resizable()
                .frame(width: 350, height: 350)
        }
        .background(Color("backgroundColor"))
        .navigationTitle("Online Library")
    }
}

struct OnlineLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineLibraryView()
    }
}
