//
//  AliveStudentsView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 04.06.2023.
//

import SwiftUI

struct AliveStudentsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("Alive Students")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Alive Students is a student organization, the main activity of which is dedicated to the arrangement of interesting projects, both entertaining and educational.")
                    .font(.headline)
                
                Text("We organized such projects as: ISE FEST, HALLOWEEN Horror Quest, ISE FOOTBALL CUP, Secret Santa, AFTER FINAL PARTY, mountain trips, Movie evenings in KBTU, Speed Dating, meetings with media personalities, paintball tournaments")
                    .font(.body)
                
                Text("Alive Students is, indeed, a big family, ready to accept everyone who will be faithful to us and our principles and will always defend our honor.")
                    .font(.body)
                
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/alive_students_/"))
                }
                
                Image("alive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
        }
        .navigationTitle("Alive Students")
        .background(Color("backgroundColor"))
    }
}

struct AliveStudentsView_Previews: PreviewProvider {
    static var previews: some View {
        AliveStudentsView()
    }
}
