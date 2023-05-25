//
//  SchoolsView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 17.03.2023.
//

import SwiftUI

struct StudentGuideDetails: View {
    let staff: [String: Staff]
    
    var body: some View {
        Color("backgroundColor")
            .ignoresSafeArea(.all)
            .overlay(
                ScrollView (showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(staff.keys.sorted(), id: \.self) { key in
                            VStack(alignment: .leading) {
                                Text("\(staff[key]!.position ?? "")")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                Text("\(staff[key]!.name ?? "") ")
                                    .font(.title3)
                                + Text("\(staff[key]!.email ?? "")")
                                    .underline()
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                if let phone = staff[key]!.phone {
                                    Text("\(phone)")
                                        .font(.title3)
                                }
                            }
                            .padding(12)
                        }
                    }
                }
            )
    }
}
struct StudentGuideView: View {
    @ObservedObject var viewModel = StudentGuideViewModel(firestoreService: FirestoreServiceNew())
    
    var body: some View {
        let schools = viewModel.schools?.filter { $0.category == "school" } ?? []
        let others = viewModel.schools?.filter { $0.category == "other" } ?? []
        
        List {
            if !schools.isEmpty {
                Section("Schools") {
                    ForEach(schools, id: \.school) { school in
                        NavigationLink(destination: StudentGuideDetails(staff: school.staff ?? [:])) {
                            Text(school.school ?? "")
                        }
                    }
                }
            }
            
            if !others.isEmpty {
                Section("Others") {
                    ForEach(others, id: \.school) { school in
                        NavigationLink(destination: StudentGuideDetails(staff: school.staff ?? [:])) {
                            Text(school.school ?? "")
                        }
                    }
                }
            }
            
            if viewModel.schools == nil {
                ProgressView()
            }
        }
    }
}
