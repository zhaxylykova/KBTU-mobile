//
//  GpaCalculatorView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 23.04.2023.
//

import SwiftUI
import Combine

struct GPAView: View {
    @State private var semesters: [Semester] = [Semester(courses: [Course(name: "", grade: "", ects: "")])]
    @State private var selectedGradeIndex = 0
    @State private var totalGpa = ""
    let grades = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "F", "AW"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                                TextField("Course Name \(courseIndex + 1)", text: $semesters[semesterIndex].courses[courseIndex].name)
                                    .multilineTextAlignment(.center)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 300)
                            }
                            HStack {
                                Spacer()
                                Text("Grade: ")
                                Picker(selection: $semesters[semesterIndex].courses[courseIndex].selectedGradeIndex, label: Text("Grade")) {
                                    ForEach(0 ..< grades.count, id: \.self) {
                                        Text(grades[$0]).tag($0)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 100, height: 50)
                                .clipped()
                                .onChange(of: semesters[semesterIndex].courses[courseIndex].selectedGradeIndex) { index in
                                    semesters[semesterIndex].courses[courseIndex].grade = grades[index]
                                }
                                Spacer()
                                TextField("ECTS", text: $semesters[semesterIndex].courses[courseIndex].ects)
                                    .multilineTextAlignment(.center)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 80)
                                    .keyboardType(.numberPad)
                                    .onChange(of: semesters[semesterIndex].courses[courseIndex].ects) { newValue in
                                        if semesters[semesterIndex].courses[courseIndex].ects.count > 1 {
                                            semesters[semesterIndex].courses[courseIndex].ects = String(semesters[semesterIndex].courses[courseIndex].ects.prefix(1))
                                        }
                                    }
                                    .onReceive(Just(semesters[semesterIndex].courses[courseIndex].ects)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.semesters[semesterIndex].courses[courseIndex].ects = filtered
                                        }
                                    }
                                Spacer()
                            }
                        }
                        .padding([.leading, .bottom, .trailing])
                        Button(action: {
                            semesters[semesterIndex].courses.append(Course(name: "", grade: "", ects: ""))
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
                    semesters.append(Semester(courses: [Course(name: "", grade: "", ects: "")]))
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
                    let grades = ["A": 4.0, "A-": 3.67, "B+": 3.33, "B": 3.0, "B-": 2.67, "C+": 2.33, "C": 2.0, "C-": 1.67, "D+": 1.33, "D": 1.0, "F": 0, "AW": 0]
                    var totalCredits = 0
                    var totalPoints = 0.0
                    semesters.forEach { semester in
                        semester.courses.forEach { course in
                            totalCredits += Int(course.ects) ?? 0
                            totalPoints += ((grades[course.grade] ?? 4.0) * (Double(course.ects) ?? 0))
                        }
                    }
                    let gpa = totalPoints / Double(totalCredits)
                    if gpa.isNaN {
                        totalGpa = "Please enter your grades"
                        return
                    }
                    totalGpa = "Your overall GPA is \(String(format: "%.2f", gpa))"
                }) {
                    Text("Calculate")
                        .font(.custom("Poppins-Medium", size: 16))
                        .padding([.top, .bottom], 4)
                        .padding([.leading, .trailing], 18)
                        .background(Color(GlobalConstants.lightPurple))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                    .padding([.top, .bottom], 12)
                Text(totalGpa)
                    .font(.custom("Poppins-Medium", size: 17))
                    .padding(.bottom, 50)
            }
        }
        .background(Color(GlobalConstants.backgroundColor))
    }
}

struct Course: Identifiable {
    let id = UUID()
    var name: String
    var grade: String
    var ects: String
    var selectedGradeIndex = 0
}

struct Semester {
    var courses: [Course]
}
