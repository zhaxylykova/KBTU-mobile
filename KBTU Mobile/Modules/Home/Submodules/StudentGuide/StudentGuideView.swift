//
//  SchoolsView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 17.03.2023.
//

import SwiftUI

struct StudentGuideView: View {
    @ObservedObject var viewModel = StudentGuideViewModel(firestoreService: FirestoreServiceNew())
//    var schools: [School] = [
//        .init(name: "School of Information Technology and Engineering"),
//        .init(name: "School of Energy and Petroleum Industry"),
//        .init(name: "School of Mathematics and Cybernetics"),
//        .init(name: "School of Geology and Exploration"),
//        .init(name: "School of Chemical Engineering"),
//        .init(name: "School of Materials Science and Green Technologies"),
//        .init(name: "Business School"),
//        .init(name: "International School of Economics"),
//        .init(name: "Kazakhstan Maritime Academy")
//    ]
//
//    var others: [Other] = [
//        .init(name: "Registrar's office"),
//        .init(name: "Accounting"),
//        .init(name: "Medical centre"),
//        .init(name: "Career centre"),
//        .init(name: "Dormitory"),
//        .init(name: "Academic Mobility"),
//        .init(name: "Help Desk"),
//        .init(name: "Library"),
//        .init(name: "Psychologist")
//    ]
    
    var body: some View {
        List {
            if let schools = viewModel.schools {
                Section("Schools") {
                    ForEach(schools, id: \.school) { school in
                        if school.category == "school" {
                            NavigationLink(destination: StudentGuideDetails(staff: school.staff ?? [:])) {
                                Text(school.school ?? "")
                            }
                        }
                    }
                }
                Section("Others") {
                    ForEach(schools, id: \.school) { school in
                        if school.category == "other" {
                            NavigationLink(destination: StudentGuideDetails(staff: school.staff ?? [:])) {
                                Text(school.school ?? "")
                            }
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
}

struct StudentGuideDetails: View {
    let staff: [String: Staff]
    
    var body: some View {
        Color("backgroundColor")
            .ignoresSafeArea(.all)
            .overlay(
                ScrollView (showsIndicators: false) {
                    VStack {
                        ForEach(staff.keys.sorted(), id: \.self) { key in
                            VStack {
                                Text("\(staff[key]!.position ?? "")")
                                    .bold()
                                Text("\(staff[key]!.name ?? "") ")
                                + Text("\(staff[key]!.email ?? "")")
                                    .underline()
                                if let phone = staff[key]!.phone {
                                    Text("\(phone)")
                                }
                            }
                            .padding(12)
                        }
                    }
                }
            )
    }
}
