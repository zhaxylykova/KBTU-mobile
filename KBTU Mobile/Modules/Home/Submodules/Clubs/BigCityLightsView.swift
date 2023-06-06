//
//  BigCityLightsView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 03.06.2023.
//

import SwiftUI

struct BigCityLightsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("Big City Lights KBTU")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Big city lights shine for you again.")
                    .font(.headline)
                
                Text("You can feel lonely. You can feel blue. It seems that you don't fit in this town. Your soul wants to fly. Familiar feelings? Student life is exactly right time for you to glow. We are not the most talented, most creative, or even most disciplined people, but we have united students with spark and love in their eyes. That is the important thing, isn't it?")
                    .font(.body)
                
                Text("We are Big City Lights and we aimed to make KBTU student life great again. Scary Halloween, unforgettable Speed Dating, most wanted Cup of 7, Reunion trip and these are only small part of what we did previously in order to take you away from squalor of world.")
                    .font(.body)
                
                Text("We are not just an organization. We are family where everyone is accepted, each of you is loved and where your ability is your highlight which is appreciated. We found a love, true friends and memories here and want to share this atmosphere with you./n New year, new goals, new edition. We will bring a fire to your heart. ")
                    .font(.body)
                
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/bigcitylightskbtu/"))
                }
                
                Image("bigcitylights")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
        }
        .navigationTitle("Big City Lights")
        .background(Color("backgroundColor"))    }
}

struct BigCityLightsView_Previews: PreviewProvider {
    static var previews: some View {
        BigCityLightsView()
    }
}
