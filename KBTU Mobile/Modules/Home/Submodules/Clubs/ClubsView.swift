//
//  ClubsView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 11.04.2023.
//

import SwiftUI

struct ClubsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    ClubsButton(
                        title: "KBTU\nFACES",
                        color: Color("studentguideColor"),
                        destination: AnyView(KbtuFacesView())
                    )
                    ClubsButton(
                        title: "ART\nHOUSE",
                        color: Color("clubsColor"),
                        destination: AnyView(StudentGuideView())
                    )
                }
                .frame(height:130)
                HStack(spacing: 20) {
                    ClubsButton(
                        title: "BIG CITY\nLIGHTS",
                        color: Color("faqColor"),
                        destination: AnyView(StudentGuideView())
                    )
                    ClubsButton(
                        title: "KBTU\nGOV",
                        color: Color("libraryColor"),
                        destination: AnyView(StudentGuideView())
                    )
                }
                .frame(height:130)
                HStack(spacing: 20) {
                    ClubsButton(
                        title: "KBTU\nSTUDENT LIFE",
                        color: Color("gpaColor"),
                        destination: AnyView(StudentGuideView())
                    )
                    ClubsButton(
                        title: "WOMEN\nEMPOWERMENT",
                        color: Color("psychologyColor"),
                        destination: AnyView(StudentGuideView())
                    )
                }
                .frame(height:130)
                HStack(spacing: 20) {
                    ClubsButton(
                        title: "ALIVE\nSTUDENTS",
                        color: Color("scholarshipsColor"),
                        destination: AnyView(StudentGuideView())
                    )
                    ClubsButton(
                        title: "KBTU\nSTARTUP",
                        color: Color("schoolsColor"),
                        destination: AnyView(StudentGuideView())
                    )
                }
                .frame(height:130)
            }
        }
        .padding()
        .navigationTitle("Clubs & Communities")
        //.navigationBarTitleDisplayMode(.inline)
        .background(Color("backgroundColor"))
    }
}

struct ClubsButton: View {
    let title: String
    let color: Color
    let destination: AnyView
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading, spacing:-20) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
            .cornerRadius(20)
            .foregroundColor(.black)
        }
    }
}

struct ClubsView_Previews: PreviewProvider {
    static var previews: some View {
        ClubsView()
    }
}
