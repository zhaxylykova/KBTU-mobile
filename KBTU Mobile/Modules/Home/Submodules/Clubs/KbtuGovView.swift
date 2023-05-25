//
//  KbtuGovView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 24.05.2023.
//

import SwiftUI

struct KbtuGovView: View {
    @ObservedObject var viewModel = KbtuFacesViewModel(firestoreService: FirestoreServiceNew())
    @State private var showErrorAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Student Government – student’s self-management system that takes place at KBTU. They coordinate ministers of each area (Culture, Science, Sports, Social Development), presidents of faculties and activists (Student Angels).")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                if let kbtufaces = viewModel.kbtufaces?.first{
                    if let contacts = kbtufaces.contacts {
                        ForEach(contacts.keys.sorted(), id: \.self) { key in
                            VStack(alignment: .leading) {
                                Text("\(contacts[key]!.position ?? "") ")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                Text("\(contacts[key]!.name ?? "") ")
                                    .font(.title3)
                                if let phone = contacts[key]!.phone {
                                    Text("\(phone)")
                                        .font(.headline)
                                }
                                if let email = contacts[key]!.email {
                                    Text("\(email)")
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                        .underline()
                                }
//                                if let instagram = contacts[key]!.instagram {
//                                    Text("\(instagram)")
//                                        .font(.title3)
//                                        .bold()
//                                        .foregroundColor(.blue)
//                                }
                            }
                            .padding(12)
                        }
                    }
                }
                VStack(alignment: .center) {
                    if let url = URL(string: "https://www.instagram.com/kbtu_gov/") {
                        HStack(alignment: .center)  {
                            Link(destination: url) {
                                HStack(alignment: .center) {
                                    Text("our instagram")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(
                                    Capsule()
                                        .fill(Color("purpleColor"))
                                )
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            }
                        }
                    } else {
                        ProgressView("Loading...")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("backgroundColor"))
        .navigationTitle("KBTU GOV")
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

struct KbtuGovView_Previews: PreviewProvider {
    static var previews: some View {
        KbtuGovView()
    }
}
