//
//  ProfileView.swift
//  KBTU Mobile
//
//  Created by Altynay on 11.04.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel(networkManager: FirebaseService(), firestoreService: FirestoreServiceNew())
    var coordinator: MainCoordinator
    
    @State private var isEditing = false
    @State private var editedEmail = "zhaaltynay@gmail.com"
    @State private var editedFaculty = "School of Information Technologies and Engineering"
    @State private var editedYearOfStudy = "4"
    @State private var editedPhoneNumber = "+7 701 913 25 99"
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                if let userData = viewModel.userData {
                    VStack {
                        Image("backImageProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Image("profileImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .padding(40)
                            )
                        
                        Text("\(userData.firstName ?? "") \(userData.lastName ?? "")")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("19B070616")
                            .font(.title2)
                            .fontWeight(.regular)
                        
                        VStack(alignment: .leading) {
                            FieldsView(fieldName: "Email", value: userData.email ?? "")
                            FieldsView(fieldName: "Faculty", value: userData.faculty ?? "")
                            FieldsView(fieldName: "Year of study", value: userData.yearOfStudy ?? "")
                            FieldsView(fieldName: "Phone number", value: userData.phoneNumber ?? "")
                        }
                        .padding(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("lightPurple"), lineWidth: 3)
                        )
                        .padding()
                        
                        Button(action: { isEditing = true }) {
                            Text("Settings")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                                .padding(30)
                                .frame(width: 350, height: 60, alignment: .leading)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("lightPurple"), lineWidth: 4)
                        )
                        .padding(.bottom, 16)
                        
                        Button(action: {
                            viewModel.logOut()
                            coordinator.moveToAuth()
                        }) {
                            Text("Log Out")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.red)
                                .padding(30)
                                .frame(width: 150, height: 40, alignment: .center)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("lightPurple"), lineWidth: 4)
                        )
                        .padding(.bottom, 48)
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            VStack {
                HStack {
                    Text("Email:")
                        .fontWeight(.semibold)
                    TextField("", text: $editedEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Text("Faculty:")
                        .fontWeight(.semibold)
                    TextField("", text: $editedFaculty)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Text("Year of study:")
                        .fontWeight(.semibold)
                    TextField("", text: $editedYearOfStudy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                HStack {
                    Text("Phone number:")
                        .fontWeight(.semibold)
                    TextField("", text: $editedPhoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            
                
                HStack {
                    Button(action: {
                        isEditing = false
                    }) {
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    Spacer()
                    
                    Button(action: {
                        // Save the edited values
                        editedEmail = editedEmail.trimmingCharacters(in: .whitespacesAndNewlines)
                        editedFaculty = editedFaculty.trimmingCharacters(in: .whitespacesAndNewlines)
                        editedYearOfStudy = editedYearOfStudy.trimmingCharacters(in: .whitespacesAndNewlines)
                        editedPhoneNumber = editedPhoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        isEditing = false
                    })
                    {
                        Text("Save")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("lightPurple"))
                    .cornerRadius(8)
                }
                .padding()
                
                
            }
           
        }
       
    }

}

struct FieldsView: View {
    var fieldName: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(fieldName)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(value)
                .font(.title2)
                .fontWeight(.regular)
        }
        .padding(0.1)
    }
}
