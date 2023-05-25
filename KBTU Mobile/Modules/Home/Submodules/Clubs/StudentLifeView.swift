//
//  StudentLifeView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 24.05.2023.
//

import SwiftUI

struct StudentLifeView: View {
    @ObservedObject var viewModel = StudentLifeViewModel(firestoreService: FirestoreServiceNew())
    @State private var showErrorAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                if let studentlife = viewModel.studentlife?.first{

                    if let contacts = studentlife.contacts {
                        ForEach(contacts.keys.sorted(), id: \.self) { key in
                            VStack(alignment: .leading) {
                                Text("\(contacts[key]!.position ?? "") ")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                Text("\(contacts[key]!.name ?? "") ")
                                    .font(.title3)
                                if let phone = contacts[key]!.phone {
                                    Text("\(phone)")
                                        .font(.title3)
                                }
                                if let email = contacts[key]!.email {
                                    Text("\(email)")
                                        .font(.title3)
                                }
                                if let instagram = contacts[key]!.instagram {
                                    Text("\(instagram)")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(12)
                        }
                    }
                }
                if let url = URL(string: "https://instagram.com/faces_kbtu?igshid=YmMyMTA2M2Y=") {
                    HStack  {
                        Link(destination: url) {
                            HStack {
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
        .navigationTitle("KBTU Student Life")
        .onAppear { viewModel.fetchStudentLife() }
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
        
//    }
//}

struct StudentLifeView_Previews: PreviewProvider {
    static var previews: some View {
        StudentLifeView()
    }
}
