//
//  CrystalView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 03.06.2023.
//

import SwiftUI

struct CrystalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("Crystal KBTU")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Crystal KBTU is an organization that has set itself the goal of holding memorable events for KBTU students.")
                    .font(.headline)
                
                Text("The tasks of the community also include assistance in the adaptation and socialization of first-year students.")
                    .font(.body)
                
                Text("Activities and projects: \n1. Invasion – intro party, annual warm-up at the beginning of the school year before upcoming events.\n2. Love Sensation is an annual event dedicated to Valentine’s Day.\n3. Thematic party – a party dedicated to a specific topic, such as Gatsby party and so on.\n4. Groove on is the noisiest party.\n5. Grand Commencement is a party dedicated to first-year students.")
                    .font(.body)
                
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/crystal_kbtu/"))
                }
                
                Image("crystal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
        }
        .navigationTitle("Crystal KBTU")
        .background(Color("backgroundColor"))    }
}

struct CrystalView_Previews: PreviewProvider {
    static var previews: some View {
        CrystalView()
    }
}
