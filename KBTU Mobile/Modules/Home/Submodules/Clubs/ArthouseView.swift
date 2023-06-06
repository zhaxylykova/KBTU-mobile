//
//  ArthouseView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 03.06.2023.
//

import SwiftUI

struct ArthouseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("ArtHouse KBTU")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("One of the brightest and most multifaceted student organizations in KBTU.")
                    .font(.headline)
                
                Text("The most talented students at the university, who make an invaluable contribution to student life, unite here! Our family connects the best musicians, dancers, artists, and lovers of photo/video shooting in order to give incredible emotions at any events within the walls of KBTU, and not only!")
                    .font(.body)
                
                Text("The participants of ArtHouse KBTU are distinguished by both creative and organizational skills. This is evidenced by the already implemented cultural events such as Acoustic Evening and BERI KEL, social projects, the creation of the ArtHouse Band popular among KBTU students, as well as the holding of a large-scale vocal show project ALMA LOUD.")
                    .font(.body)
                
                Text("ArtHouse KBTU is in search of new talents among KBTU students and strives for new successes and a significant diversity of student life!")
                    .font(.body)
                
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/arthouse_kbtu/"))
                }
                
                Image("arthouse")
                    .resizable()
                    .aspectRatio(contentMode: .fill)                
            }
            .padding()
        }
        .navigationTitle("Arthouse")
        .background(Color("backgroundColor"))
    }

    
    
    struct ArthouseView_Previews: PreviewProvider {
        static var previews: some View {
            ArthouseView()
        }
    }
}
