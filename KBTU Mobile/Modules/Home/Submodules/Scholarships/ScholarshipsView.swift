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
                    ForEach(0..<scholarships.count, id: \.self) { index in
                        if index % 3 == 0 {
                            NavigationLink(destination: InfoView(scholarship: scholarships[index])) {
                                Text(scholarships[index].title ?? "")
                                    .font(.title)
                                    .foregroundColor(Color("darkPurple"))
                                    .padding()
                                    .frame(width: 360, height: 100)
                                    .background(Color("purpleColor"))
                                    .cornerRadius(15)
                                    .padding(.top,10)
                            }
                        } else if index % 3 == 1 {
                            HStack(spacing: 20) {
                                NavigationLink(destination: InfoView(scholarship: scholarships[index])) {
                                    Text(scholarships[index].title ?? "")
                                        .font(.title)
                                        .foregroundColor(Color("darkPurple"))
                                        .padding()
                                        .frame(width: 170, height: 100)
                                        .background(Color("lightBlue"))
                                        .cornerRadius(15)
                                }
                                if index + 1 < scholarships.count {
                                    NavigationLink(destination: InfoView(scholarship: scholarships[index + 1])) {
                                        Text(scholarships[index + 1].title ?? "")
                                            .font(.title)
                                            .foregroundColor(Color("darkPurple"))
                                            .padding()
                                            .frame(width: 170, height: 100)
                                            .background(Color("clubsColor"))
                                            .cornerRadius(15)
                                    }
                                }
                            }
                            .frame(height: 80)
                            .padding(12)
                        }
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
