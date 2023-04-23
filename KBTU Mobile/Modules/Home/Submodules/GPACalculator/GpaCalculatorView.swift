//
//  GpaCalculatorView.swift
//  KBTU Mobile
//
//  Created by Olzhas Seilkhanov on 23.04.2023.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var name: String
    var grade: Double
    var ects: Double
}

struct Semester {
    var courses: [Course]
}

struct GPAView: View {
    @State private var semesters: [Semester] = [Semester(courses: [Course(name: "", grade: 0, ects: 0)])]
    @State private var courseText = ""
    @State private var emptyText = ""
    @State private var emptyText2 = ""
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(semesters.indices, id: \.self) { semesterIndex in
                    VStack {
                        HStack {
                            Text("Semester \(semesterIndex + 1)")
                                .font(.custom("Poppins-Medium", size: 20))
                            Spacer()
                        }
                        .padding([.leading, .top])
                        ForEach(semesters[semesterIndex].courses.indices, id: \.self) { courseIndex in
                            HStack {
                                TextField("Course Name \(courseIndex + 1)", text: $courseText)
//                                    .background(Color(GlobalConstants.backgroundColor))
                                    .multilineTextAlignment(.center)
                                    .accentColor(Color(GlobalConstants.backgroundColor))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 300)
                            }
                            HStack {
                                Spacer()
                                TextField("Grade", text: $emptyText)
//                                    .background(Color(GlobalConstants.backgroundColor))
                                    .multilineTextAlignment(.center)
                                    .accentColor(Color(GlobalConstants.backgroundColor))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 80)
                                Spacer()
                                TextField("ECTS", text: $emptyText2)
//                                    .background(Color(GlobalConstants.backgroundColor))
                                    .multilineTextAlignment(.center)
                                    .accentColor(Color(GlobalConstants.backgroundColor))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 80)
                                Spacer()
                            }
                        }
                        .padding([.leading, .bottom, .trailing])
                        Button(action: {
                            semesters[semesterIndex].courses.append(Course(name: "", grade: 0, ects: 0 ))
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(Color(GlobalConstants.purple))
                                .padding([.top, .bottom], 6)
                                .padding([.leading, .trailing], 12)
                                .bold()
                        }
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    }
                    .background(Color(GlobalConstants.lightPurple))
                    .cornerRadius(10)
                    .padding()
                }
                Button(action: {
                    semesters.append(Semester(courses: [Course(name: "", grade: 0, ects: 0)]))
                }) {
                    Text("Add Semester")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding([.top, .bottom], 4)
                        .padding([.leading, .trailing], 18)
                        .background(Color(GlobalConstants.lightPurple))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                Button(action: {
                    
                }) {
                    Text("Calculate")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding([.top, .bottom], 4)
                        .padding([.leading, .trailing], 18)
                        .background(Color(GlobalConstants.lightPurple))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                .padding(.top, 12)
                .padding(.bottom, 50)
            }
        }
        .background(Color(GlobalConstants.backgroundColor))
    }
}
