//
//  ProfileView.swift
//  KBTU Mobile
//
//  Created by Altynay on 11.04.2023.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel(networkManager: FirebaseService(), firestoreService: FirestoreServiceNew())
    @State private var showErrorAlert = false
    @State private var updatedUserData = UserDataModel()
    @State private var isPickerShowing = false
    @State private var selectedImage: UIImage? = UIImage(data: (UserDefaults.standard.object(forKey: "avatarImage") as? Data ?? Data()))
    @State private var isEditing = false
    var coordinator: MainCoordinator
    
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                if let userData = viewModel.userData {
                    VStack {
                        Image(uiImage: (selectedImage ?? UIImage(named: "backImageProfile")) ?? UIImage())
                            .resizable()
                            .frame(width: 130, height: 130)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .onTapGesture {
                                isPickerShowing = true
                            }
                            .background {
                                Rectangle()
                                    .foregroundColor(Color(GlobalConstants.lightPurple))
                                    .frame(width: UIScreen.main.bounds.size.width, height: 200)
                            }
                            .padding(60)
                            
                        Text("\(userData.firstName ?? "") \(userData.middleName ?? "") \(userData.lastName ?? "")")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("\(userData.studentId ?? "")")
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
                } else if !showErrorAlert {
                    ProgressView("Loading...")
                }
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "An unknown error occurred."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .onReceive(viewModel.$userData) { userData in
                if let userData {
                    updatedUserData = userData
                }
            }
            .onReceive(viewModel.$errorMessage) { errorMessage in
                if errorMessage != nil {
                    showErrorAlert = true
                }
            }
        }
        .sheet(isPresented: $isPickerShowing) {
            ImagePickerView(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
        .sheet(isPresented: $isEditing) {
            let currentSchool = GlobalConstants.facultyList.firstIndex(of: viewModel.userData?.faculty ?? "") ?? 0
            EditUserView(userData: viewModel.userData, currentSchool: currentSchool, isEditing: $isEditing, viewModel: viewModel)
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

struct EditUserView: View {
    @State var userData: UserDataModel?
    @State var currentSchool: Int
    @Binding var isEditing: Bool
    
    @State private var showAlert = false
    var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("First Name:")
                    .fontWeight(.semibold)
                TextField("", text: Binding(
                    get: { userData?.firstName ?? "" },
                    set: { userData?.firstName = $0 }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            if
                let middleNameIsEmpty = userData?.middleName?.isEmpty,
                !middleNameIsEmpty
            {
                HStack {
                    Text("Middle Name:")
                        .fontWeight(.semibold)
                    TextField("", text: Binding(
                        get: { userData?.middleName ?? "" },
                        set: { userData?.middleName = $0 }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            }
            HStack {
                Text("Last Name:")
                    .fontWeight(.semibold)
                TextField("", text: Binding(
                    get: { userData?.lastName ?? "" },
                    set: { userData?.lastName = $0 }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            HStack {
                Text("Email:")
                    .fontWeight(.semibold)
                TextField("", text: Binding(
                    get: { userData?.email ?? "" },
                    set: { userData?.email = $0 }
                ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            HStack {
                Text("Faculty:")
                    .fontWeight(.semibold)
                Picker(selection: $currentSchool, label: Text("Grade")) {
                    ForEach(0 ..< GlobalConstants.facultyList.count, id: \.self) {
                        Text(GlobalConstants.facultyList[$0]).tag($0)
                            .font(.custom("Poppins-Light", size: 12))
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 70)
                .clipped()
            }
            .padding()
            .onChange(of: userData?.faculty) { newValue in
                currentSchool = 5
            }
            
            HStack {
                Text("Year of study:")
                    .fontWeight(.semibold)
                TextField("", text: Binding(
                    get: { userData?.yearOfStudy ?? "" },
                    set: { userData?.yearOfStudy = $0 }
                ))
                .frame(width: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .onChange(of: userData?.yearOfStudy) { newValue in
                    if userData?.yearOfStudy?.count ?? 1 > 1 {
                        userData?.yearOfStudy = String(userData?.yearOfStudy?.prefix(1) ?? "")
                    }
                }
                .onReceive(Just(userData?.yearOfStudy)) { newValue in
                    let filtered = newValue?.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.userData?.yearOfStudy = filtered
                    }
                }
                Spacer()
            }
            .padding()
            
            HStack {
                Text("Phone number:")
                    .fontWeight(.semibold)
                TextField("", text: Binding(
                    get: { userData?.phoneNumber ?? "" },
                    set: { userData?.phoneNumber = $0 }
                ))
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
                    userData?.faculty = GlobalConstants.facultyList[currentSchool]
                    if
                        let validPhone = userData?.phoneNumber?.isValidPhone(),
                        let validEmail = userData?.email?.isValidEmail(),
                        validPhone,
                        validEmail
                    {
                        isEditing = false
                        viewModel.updateUserData(with: userData)
                    } else {
                        showAlert = true
                    }
                    
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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Please enter correct email or phone number format"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
