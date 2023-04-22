//
//  ScholarshipsView.swift
//  kbtu-mob
//
//  Created by Altynay on 28.03.2023.
//

import SwiftUI

struct ScholarshipsView: View {
    @ObservedObject var viewModel = ScholarshipsViewModel(firestoreService: FirestoreService<ScholarshipDataModel>())
    @State private var showErrorAlert = false
    
    var body: some View {
    Color("backgroundColor")
            .ignoresSafeArea(.all)
            .overlay(
        ScrollView {
            VStack {
                if let scholarships = viewModel.scholarships {
                    ForEach(scholarships) { scholarship in
                        HStack {
                            Text(scholarship.title ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Text(scholarship.title ?? "")
                        }
                        .frame(height: 80)
                        .padding(12)
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
        }
        .padding()
        .navigationBarTitle("Scholarships")
        .onAppear { viewModel.fetchScholarships() }
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
        })
    }
}

//struct ScholarshipsView: View {
//
//    @ObservedObject var viewModel = ScholarshipsViewModel()
//
//    var body: some View {
//        VStack(spacing: 25) {
//            NavigationLink(destination: InfoView()){
//                Text("KAZENERGY")
//                    .font(.title)
//                    .foregroundColor(Color("darkPurple"))
//                    .padding()
//                    .frame(width: 390, height: 100)
//                    .background(Color("purpleColor"))
//                    .cornerRadius(15)
//                    .padding(.top,10)
//            }
//
//            HStack(spacing: 20){
//                NavigationLink(destination: SecondView(color:.red)){
//                    Text("ERASMUS")
//                        .font(.title)
//                        .foregroundColor(Color("darkPurple"))
//                        .padding()
//                        .frame(width: 185, height: 100)
//                        .background(Color("lightBlue"))
//                        .cornerRadius(15)
//                }
//
//                NavigationLink(destination: SecondView(color:.red)){
//                    Text("KBTU ALUMNI")
//                        .font(.title)
//                        .foregroundColor(Color("darkPurple"))
//                        .padding()
//                        .frame(width: 185, height: 100)
//                        .background(Color("lightOrange"))
//                        .cornerRadius(15)
//                }
//            }
//
//            NavigationLink(destination: SecondView(color:.red)){
//                Text("DENIS TEN")
//                    .font(.title)
//                    .foregroundColor(Color("darkPurple"))
//                    .padding()
//                    .frame(width: 390, height: 100)
//                    .background(Color("Blue"))
//                    .cornerRadius(15)
//            }
//
//            HStack(spacing: 20){
//                NavigationLink(destination: SecondView(color:.red)){
//                    Text("CREATIVE SPARK")
//                        .font(.title)
//                        .foregroundColor(Color("darkPurple"))
//                        .padding()
//                        .frame(width: 185, height: 100)
//                        .background(Color("purpleColor"))
//                        .cornerRadius(15)
//                }
//
//                NavigationLink(destination: SecondView(color:.red)){
//                    Text("BRITISH COUNCIL")
//                        .font(.title)
//                        .foregroundColor(Color("darkPurple"))
//                        .padding()
//                        .frame(width: 185, height: 100)
//                        .background(Color("lightPink"))
//                        .cornerRadius(15)
//                }
//            }
//            Spacer()
//        }
//        .padding()
//        .navigationBarTitle("Scholarships")
//        .background(Color("backgroundColor"))
//    }
//}

struct SecondView: View {
    let color: Color
    
    var body: some View{
        ZStack{
            color.edgesIgnoringSafeArea(.all)
            Text("Scholarships from KAZENERGY")
                .font(.system(size:30, weight: .bold))
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}

struct ScholarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        StudentGuideView()
    }
}
