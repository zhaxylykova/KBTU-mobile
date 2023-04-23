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
            Section("Schools") {
                if let schools = viewModel.schools {
                    ForEach(schools, id: \.school) { school in
                        NavigationLink(destination: StudentGuideDetails(staff: school.staff ?? [:])) {
                            Text(school.school ?? "")
                        }
                    }
                } else {
                    ProgressView()
                }
            }
//            Section("Others") {
//                ForEach(others, id: \.name) { other in
//                    NavigationLink(destination: StudentGuideDetails(title: other.name)) {
//                        Text(other.name)
//                    }
//                }
//            }
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
