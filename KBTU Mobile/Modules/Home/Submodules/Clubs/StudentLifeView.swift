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
                Text("Department of student affairs provides an opportunity to develop student’s leadership skills and works on brightening up the Student Life. We help students on solving various questions during the study years and coordinate the work of Student Government and Student Organizations.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color("lightpurpleColor"))
                Text("Contacts of managers:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    //.padding()
                if let studentlife = viewModel.studentlife?.first{
                    if let contacts = studentlife.contacts {
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
                VStack(alignment: .center) {
                    InstagramButtonView(url: URL(string: "https://www.instagram.com/kbtu_studentlife/"))
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
