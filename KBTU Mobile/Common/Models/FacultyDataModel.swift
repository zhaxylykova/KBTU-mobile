//
//  FacultyDataModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 12.06.2023.
//

import Foundation

struct Specialization: Identifiable, Equatable {
    
    let id = UUID()
    let name: String
    let degree: Degree
    let faculty: Faculty

}

struct Career:Identifiable, Equatable {
    
    let id = UUID()
    let name: String
    let faculty: Faculty
}

struct Subject: Identifiable, Equatable{
    let id = UUID()
    let name: String
    let trackName: String
}

struct Track: Identifiable, Equatable, Hashable{
    let id = UUID()
    let name: String
    let faculty: Faculty
}



enum Degree: String, CaseIterable {
    case bachelor
    case master
    case phd
}

enum Faculty: String, CaseIterable {
    case site = "School of Information Technology and Engineering"
    case bs = "Business School"
    case sepi = "School of Energy and Petroleum Industry"
    case smc = "School of Mathematic and Cybernetics"
    case ise = "International School of Economics"
    case kma = "Kazakhstan Maritime Academy"
    case sce = "School of Chemical Engineering"
    case snss = "School of Natural and Social Sciences"
    case sge = "School of Geology and Exploration"
    case smsgt = "School of Materials Science and Green Technologies"
}
