//
//  FacultyView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 12.06.2023.
//

import SwiftUI

struct FacultyView: View {
    @StateObject private var viewModel = FacultyViewModel()
    @State private var selectedTrack: Track? = nil

    var body: some View {
        Color("backgroundColor")
            .ignoresSafeArea(.all)
            .overlay(
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Degree.allCases, id: \.self) { degree in
                            Section(header: Text("\(degree.rawValue.capitalized) Degree")
                                        .font(.headline)
                                        .bold()){
                                            ForEach(viewModel.specializations.filter({ $0.degree == degree && $0.faculty == .site})) { specialization in
                                    Text(specialization.name)
                                }
                            }
                        }

                        VStack(alignment: .leading, spacing: 16){
                            Text("Tracks for Bachelor Degree")
                                .font(.headline)

                            ForEach(viewModel.tracks){ track in
                                Button(action: {
                                    if selectedTrack == track {
                                        selectedTrack = nil
                                    } else {
                                        selectedTrack = track
                                    }
                                }) {
                                    Text(track.name)
                                        .padding()
                                        .foregroundColor(.black)
                                        .frame(width: 350)
                                        .background(Color("purpleColor"))
                                        .cornerRadius(10)
                                }
                                .padding(.vertical, 8)

                                if let selectedTrack = selectedTrack, selectedTrack == track {
                                    ForEach(viewModel.subjects.filter({ $0.trackName == track.name })) { subject in
                                        Text(subject.name)
                                            .padding(.leading)
                                    }
                                }
                            }
                        }

                        VStack(alignment: .leading){
                            Text("Career opportunities")
                                .font(.headline)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 130), spacing: 16)], spacing: 16) {
                                ForEach(viewModel.jobOpportunities.indices, id: \.self){ index in
                                    let career = viewModel.jobOpportunities[index]
                                    if career.faculty == .site {
                                        Text(career.name)
                                            .foregroundColor(.black)
                                            .padding(.vertical,10)
                                            .padding(.horizontal, 16)
                                            .background(viewModel.jobColors[index % viewModel.jobColors.count])
                                            .cornerRadius(30)
                                    }
                                }
                            }
                        }
                    }
                    .padding(30)
                }
            )
    }
}

struct FacultyView_Previews: PreviewProvider {
    static var previews: some View {
        FacultyView()
    }
}

