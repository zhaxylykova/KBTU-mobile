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
        let content: AnyView
        
        if let scholarships = viewModel.scholarships {
            content = AnyView(loadedView(for: scholarships))
        } else {
            content = AnyView(loadingView())
        }
        
        return content
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
            }
    }
    
    func loadedView(for scholarships: [ScholarshipDataModel]) -> some View {
        ScrollView {
            VStack {
                ForEach(scholarships.indices, id: \.self) { index in
                    if index % 3 == 0 {
                        NavigationLink(destination: InfoView(scholarship: scholarships[index])) {
                            ScholarshipTileView(scholarship: scholarships[index], tileWidth: 360)
                        }
                    } else if index % 3 == 1 {
                        HStack(spacing: 20) {
                            NavigationLink(destination: InfoView(scholarship: scholarships[index])) {
                                ScholarshipTileView(scholarship: scholarships[index], tileWidth: 170)
                            }
                            if index + 1 < scholarships.count {
                                NavigationLink(destination: InfoView(scholarship: scholarships[index + 1])) {
                                    ScholarshipTileView(scholarship: scholarships[index + 1], tileWidth: 170)
                                }
                            }
                        }
                        .frame(height: 80)
                        .padding(12)
                    }
                }
            }
        }
    }
    
    func loadingView() -> some View {
        ProgressView("Loading...")
    }
}

struct ScholarshipTileView: View {
    let scholarship: ScholarshipDataModel
    let tileWidth: CGFloat
    
    var body: some View {
        Text(scholarship.title ?? "")
            .font(.title)
            .foregroundColor(Color("darkPurple"))
            .padding()
            .frame(width: tileWidth, height: 100)
            .background(tileColor(for: tileWidth))
            .cornerRadius(15)
            .padding(.top, 10)
    }
    
    func tileColor(for width: CGFloat) -> Color {
        if width == 360 {
            return Color("purpleColor")
        } else {
            return Color("lightBlue")
        }
    }
}

struct SecondView: View {
    let color: Color

    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            Text("Scholarships from KAZENERGY")
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 100, alignment: .center)
        }
    }
}



struct ScholarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        ScholarshipsView()
    }
}
