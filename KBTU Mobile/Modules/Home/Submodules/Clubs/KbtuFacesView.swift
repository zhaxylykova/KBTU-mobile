//
//  KbtuFacesView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 11.04.2023.
//

import SwiftUI

struct KbtuFacesView: View {
    @ObservedObject var viewModel = KbtuFacesViewModel(firestoreService: FirestoreServiceNew())
    @State private var showErrorAlert = false
//    let contacts: [String: Contacts]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Upcoming events:")
                    .font(.title2)
                    .fontWeight(.bold)
                if let kbtufaces = viewModel.kbtufaces?.first{
                    Text(kbtufaces.title)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        //.padding()
                    Text(kbtufaces.subtitle1)
                        .font(.body)
                        //.padding()
                    Text(kbtufaces.subtitle2)
                        .font(.body)
                        //.padding()
                    Text(kbtufaces.subtitle3)
                        .font(.body)
                        .fontWeight(.semibold)
                    if let contacts = kbtufaces.contacts {
                        ForEach(contacts.keys.sorted(), id: \.self) { key in
                            VStack(alignment: .leading) {
                                Text("\(contacts[key]!.name ?? "") ")
                                + Text("\(contacts[key]!.phone ?? "")")
                                    .underline()
                                Text("\(contacts[key]!.instagram ?? "")")
                                    .bold()
                            }
                            .padding(12)
                        }
                    }
                }
                if let url = URL(string: "https://instagram.com/faces_kbtu?igshid=YmMyMTA2M2Y=") {
                    HStack  {
                        Link(destination: url) {
                            HStack {
//                                Image(systemName: "camera.fill")
//                                    .foregroundColor(.white)
//                                    .font(.title2)
                                Text("our instagram")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color("backgroundColor"))
                            )
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("backgroundColor"))
        .navigationTitle("KBTU FACES")
        .onAppear { viewModel.fetchKbtuFaces() }
        .onChange(of: viewModel.errorMessage) { errorMessage in
            if errorMessage != nil {
                showErrorAlert = true
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Error fetching data"),
                message: Text(viewModel.errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
