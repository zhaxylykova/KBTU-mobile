//
//  KbtuFacesView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 11.04.2023.
//

import SwiftUI

struct KbtuFacesView: View {
    let items = [
        CarouselItem(image: "kbtuFacesImage1", title: "Mister & Miss KBTU"),
        CarouselItem(image: "kbtuFacesImage2", title: "Mister & Miss KBTU after party")
    ]
    var body: some View {
        ScrollView {
            VStack() {
                Text("Upcoming events")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(0)
                
                CarouselSlider(items: items)
                    .padding(.horizontal)
                    .padding(.top, -150)
            }
            .padding(.top, 20)
        }
        .background(Color("backgroundColor"))
        .navigationTitle("KBTU FACES")
        
    }
}

struct KbtuFacesView_Previews: PreviewProvider {
    static var previews: some View {
        KbtuFacesView()
    }
}
