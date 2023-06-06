//
//  StartupView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 04.06.2023.
//

import SwiftUI

struct StartupView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("KBTU Startup Incubator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Our goal is help the development of youth startup projects in the field of high technology and information technology from idea to successful business.")
                    .font(.headline)
                
                Text("KBTU Startup Incubator allows every student with ideas to choose/generate the most prominent Idea and walk the full path from (MCI) Maximum Competitive Idea to (MVP) Minimum Viable Product and Techno Business")
                    .font(.body)
                
                Text("The feature of our Incubator is that it was created on the basis of the best technical university in the region. The largest number of successful global startups were created by students of the best technical universities in the world. Now, students and graduates of KBTU have the opportunity to realize their idea within the walls of their native university and create their own company both for the market of Kazakhstan and the whole world. The Internet and technology businesses today erase the boundaries of the market. For this, the KBTU Incubator creates the necessary conditions.")
                    .font(.body)
                
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/kbtustartup/"))
                }
                
                Image("startup")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
        }
        .navigationTitle("KBTU Startup")
        .background(Color("backgroundColor"))
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
