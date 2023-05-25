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
    
    private let gridItems = [GridItem(.adaptive(minimum: 170, maximum: 360))]
    
    var body: some View {
        Color("backgroundColor")
            .ignoresSafeArea(.all)
            .overlay(
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(viewModel.scholarships ?? []) { scholarship in
                            NavigationLink(destination: InfoView(scholarship: scholarship)) {
                                ScholarshipCardView(scholarship: scholarship)
                            }
                        }
                    }
                    .padding()
                }
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
                }
            )
    }
}

struct ScholarshipCardView: View {
    let scholarship: ScholarshipDataModel
    let colors = [Color("lightBlue"), Color("clubsColor"), Color("Green"), Color("purpleColor")]
    
    var body: some View {
        VStack {
            Text(scholarship.title ?? "")
                .font(.title)
                .foregroundColor(Color("darkPurple"))
                .padding()
                .frame(height: 100)
                .background(scholarshipBackgroundColor)
                .cornerRadius(15)
        }
    }
    
    private var scholarshipBackgroundColor: Color {
            let randomIndex = Int.random(in: 0..<colors.count)
            return colors[randomIndex]
        }
}

struct ScholarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        ScholarshipsView()
    }
}
