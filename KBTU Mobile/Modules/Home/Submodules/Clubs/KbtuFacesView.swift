//
//  KbtuFacesView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 11.04.2023.
//

import SwiftUI

struct KbtuFacesView: View {
//    @ObservedObject var viewModel = KbtuFacesViewModel(firestoreService: FirestoreServiceNew())
//    @State private var showErrorAlert = false


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("KBTU Faces")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("We organize entertaining events.")
                    .font(.headline)
                
                Text("Faces is the official club of KBTU for organizing the largest entertainment events such as Mr. and Mrs. KBTU, KBTU ON ICE, PHOTOHUNTER and others. The main goal of Faces family is to enrich student life, organize cultural and leisure activities. The club has been operating for more than 8 years and during this time has won numerous KBTU awards.")
                    .font(.body)

                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/faces_kbtu/"))
                }
                
                Image("faces")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
        }
        .navigationTitle("KBTU Faces")
        .background(Color("backgroundColor"))
    }
}
