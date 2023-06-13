//
//  FacultyViewModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 12.06.2023.
//

import SwiftUI

class FacultyViewModel: ObservableObject {

    @Published var specializations: [Specialization] = [
        // BACHELOR
        // ФИТ
        Specialization(name: "Information Systems", degree: .bachelor, faculty: .site),
        Specialization(name: "Automation and Control", degree: .bachelor, faculty: .site),
        Specialization(name: "Computer System and Software", degree: .bachelor, faculty: .site),
        // БШ
        Specialization(name: "Accounting and Audit", degree: .bachelor, faculty: .bs),
        Specialization(name: "Management", degree: .bachelor, faculty: .bs),
        Specialization(name: "Finance", degree: .bachelor, faculty: .bs),
        Specialization(name: "Marketing", degree: .bachelor, faculty: .bs),
        Specialization(name: "Entrepreneurship", degree: .bachelor, faculty: .bs),
        //ФЭНГИ
        Specialization(name: "Petroleum Engineering", degree: .bachelor, faculty: .sepi),
        //НОЦМиК
        Specialization(name: "Matematical and Computer Modelling", degree: .bachelor, faculty: .smc),

        //МШЭ
        Specialization(name: "Mathematics & Economics", degree: .bachelor, faculty: .ise),
        Specialization(name: "Economics & Finance", degree: .bachelor, faculty: .ise),
        Specialization(name: "Economics", degree: .bachelor, faculty: .ise),
        Specialization(name: "Data Science and Business Analytics", degree: .bachelor, faculty: .ise),

        //КМА
        Specialization(name: "Nautical sciences", degree: .bachelor, faculty: .kma),
        Specialization(name: "Marine engineering", degree: .bachelor, faculty: .kma),
        
        //НОЦХИ
        Specialization(name: "Chemical technology of organic substances", degree: .bachelor, faculty: .sce),
        //ФГИГ
        Specialization(name: "Geology exploration of mineral deposits", degree: .bachelor, faculty: .sge),
        //НОЦАиЭН
        Specialization(name: "Engineering physics and technologies of new materials", degree: .bachelor, faculty: .smsgt),
        

        // MASTER
        // ФИТ
        Specialization(name: "Data Science", degree: .master, faculty: .site),
        Specialization(name: "IT Management", degree: .master, faculty: .site),
        Specialization(name: "Software Engineering", degree: .master, faculty: .site),
        Specialization(name: "Computer Science and Data Analytics", degree: .master, faculty: .site),
        Specialization(name: "Information Systems", degree: .master, faculty: .site),
        Specialization(name: "Industrial and Systems Engineering", degree: .master, faculty: .site),
        Specialization(name: "Electronics and control systems", degree: .master, faculty: .site),
        Specialization(name: "Smart Cities and Smart Systems", degree: .master, faculty: .site),
        // БШ
        Specialization(name: "International MBA", degree: .master, faculty: .bs),
        Specialization(name: "MBA in Marketing", degree: .master, faculty: .bs),
        Specialization(name: "MS in Financial Analysis", degree: .master, faculty: .bs),
        Specialization(name: "MS in Management Accounting", degree: .master, faculty: .bs),
        Specialization(name: "MS in Human Resourses Management", degree: .master, faculty: .bs),
        Specialization(name: "MS in Project Management", degree: .master, faculty: .bs),
        //ФЭНГИ
        Specialization(name: "Petroleum Engineering", degree: .master, faculty: .sepi),
        Specialization(name: "Industrial Project Management and Engineering", degree: .master, faculty: .sepi),
        //НОЦМиК
        Specialization(name: "Matematical and Computer Modelling", degree: .master, faculty: .smc),

        //МШЭ
        Specialization(name: "Business Analytics", degree: .master, faculty: .ise),
        Specialization(name: "Data Science", degree: .master, faculty: .ise),
        
        //КМА
        Specialization(name: "Offshore engineering and shipping operations", degree: .bachelor, faculty: .kma),
        Specialization(name: "Transport engineering and planning", degree: .bachelor, faculty: .kma),
        
        //НОЦХИ
        Specialization(name: "Chemical technology of organic substances", degree: .master, faculty: .sce),
        
        //ФГИГ
        Specialization(name: "Geology exploration of mineral deposits", degree: .master, faculty: .sge),
    
        //НОЦАиЭН
        Specialization(name: "Nanomaterials and nanotechnology", degree: .master, faculty: .smsgt),
        Specialization(name: "Materials science and technology of new materials", degree: .master, faculty: .smsgt),

        
        // PHD
        // ФИТ
        Specialization(name: "Computer Science, Computer Engineering", degree: .phd, faculty: .site),
        Specialization(name: "Computer Science and Artificial Intelligence", degree: .phd, faculty: .site),
        //ФЭНГИ
        Specialization(name: "Petroleum Engineering", degree: .phd, faculty: .sepi),
        //НОЦМиК
        Specialization(name: "Matematical and Computer Modelling", degree: .phd, faculty: .smc),
        //НОЦХИ
        Specialization(name: "Chemical technology of organic substances", degree: .phd, faculty: .sce),
        Specialization(name: "Chemical technology of inorganic substances", degree: .phd, faculty: .sce),
        Specialization(name: "Petrochemistry", degree: .phd, faculty: .sce),
        //ФГИГ
        Specialization(name: "General and regional geology", degree: .phd, faculty: .sge),
        //НОЦАиЭН
        Specialization(name: "Nanomaterials and nanotechnology", degree: .phd, faculty: .smsgt),
        Specialization(name: "Materials science and technology of new materials", degree: .phd, faculty: .smsgt),
        Specialization(name: "Metallurgy", degree: .phd, faculty: .smsgt)
    ]
    
    
    @Published var tracks: [Track] = [
        Track(name: "Big Data Ananlytics", faculty: .site),
        Track(name: "Cybersecurity", faculty: .site),
        Track(name: "Computer Graphics & Design", faculty: .site),
        Track(name: "Digital Media", faculty: .site),
        Track(name: "Full Stack WEB Development", faculty: .site),
        Track(name: "Data Communication & Industrial IT", faculty: .site),
        Track(name: "Computer Aided Engineering", faculty: .site),
        Track(name: "Mobile Development", faculty: .site),
        Track(name: "Information Systems Environment", faculty: .site),
        Track(name: "Computer Vision Technology", faculty: .site),
        Track(name: "Robotization of production facilities", faculty: .site)]
    
    @Published var subjects: [Subject] = [
        Subject(name: "STAT3131 Advanced Statistics, 5 ects", trackName: "Big Data Ananlytics"),
        Subject(name: "CSCI3233 Data Mining, 5 ects", trackName: "Big Data Ananlytics"),
        Subject(name: "CSCI4231 Data Storage & Analysis, 5 ects", trackName: "Big Data Ananlytics"),
        Subject(name: "CSCI3241 Deep Learning, 5 ects", trackName: "Big Data Ananlytics"),
        Subject(name: "MATH4133 Introduction to AI, 5 ects", trackName: "Big Data Ananlytics"),
        Subject(name: "MATH2206 Mathematical Foundations of Information Security, 5 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS3233 Networks and security, 5 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS3132 Security issue in WEB and Mobile Applications, 7 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS4137 Security of Operating Systems, 5 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS4139 Ethical Hacking, 5 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS5106 Industrial Espionage: Technical Means of Countering, 5 ects", trackName: "Cybersecurity"),
        Subject(name: "INFS4240 Cybersecurity management: Enterprise, National and international level, 4 ects", trackName: "Cybersecurity"),
        Subject(name: "INFG2231 Object Modeling using Polygon Surface, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFG3132 3D Character Design, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFG3233 VFX and 3D physics, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFG4134 Filmmaking and Motion Graphics, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFG4135 Augmented and Virtual Reality, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFG4236 Game development and design, 5 ects", trackName: "Computer Graphics & Design"),
        Subject(name: "INFJ2101 Introduction to Media Studies, 5 ects", trackName: "Digital Media"),
        Subject(name: "INFJ3203 Creating and Promoting Advertising in Internet, 5 ects", trackName: "Digital Media"),
        Subject(name: "INFJ3102 Newswritting and Reporting, 5 ects", trackName: "Digital Media"),
        Subject(name: "INFJ4104 Journalism, Ethics & Politics, 5 ects", trackName: "Digital Media"),
        Subject(name: "INFJ4105 Media and Information Security, 5 ects", trackName: "Digital Media"),
        Subject(name: "INFJ4206 Master Class from IT journalists, 5 ects", trackName: "Digital Media"),
        Subject(name: "ACEN3131 Industrial Networks and Fieldbuses, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN3134 Internet of Things and Embedded Systems, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN3232 Real Time Operating Systems, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN4133 Engineer graphics on AutoCad, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN4135 Server engineering and configuration implementation, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN4236 SCADA systems and Industrial networks, 5 ects", trackName: "Data Communication & Industrial IT"),
        Subject(name: "ACEN3137 Networks and Telecommunications, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN3134 Internet of Things and Embedded Systems, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN3232 Real Time Operating Systems, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN4135 Server engineering and configuration implementation, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN4140 Optimal Control of Automation Objects, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN4241 Supervisory Control Fundamentals, 5 ects", trackName: "Computer Aided Engineering"),
        Subject(name: "ACEN3144 Robotics in Manufacturing, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "ACEN3145 Industrial Robot Operations, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "ACEN3246 Computational Motion Planning, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "ACEN4147 Robotics: Estimation and Learning, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "ACEN4148 PLC Robot Control, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "ACEN4249 Introduction to development of digital microcircuit technology, 5 ects", trackName: "Robotization of production facilities"),
        Subject(name: "CSCI3240 Introduction to Computer Vision, 5 ects", trackName: "Computer Vision Technology"),
        Subject(name: "CSCI3241 Deep Learning, 5 ects", trackName: "Computer Vision Technology"),
        Subject(name: "CSCI3242 Convolutional Neural Networks, 5 ects", trackName: "Computer Vision Technology"),
        Subject(name: "INFT3139 JS Framework.React, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT3140 JS Framework.Angular, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT3131 Backend Framework.Django, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT3132 Backend Framework.Spring, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT4242 Backend for High Loaded Environment, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT4244 UI/UX Design, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "CSCI3245 Cloud Application Development, 5 ects", trackName: "Full Stack WEB Development"),
        Subject(name: "INFT3135 Android Development, 5 ects", trackName: "Mobile Development"),
        Subject(name: "INFT3136 iOS Development, 5 ects", trackName: "Mobile Development"),
        Subject(name: "INFS3132 Security issue in WEB and Mobile Applications, 7 ects", trackName: "Mobile Development"),
        Subject(name: "INFT4244 UI/UX Design, 5 ects", trackName: "Mobile Development"),
        Subject(name: "INFT3137 Android Advanced, 5 ects", trackName: "Mobile Development"),
        Subject(name: "INFT3137 iOS Advanced, 5 ects", trackName: "Mobile Development"),
        Subject(name: "INFT3230 IT audit, 5 ects", trackName: "Information Systems Environment"),
        Subject(name: "INFT4148 Enterprise Architecture, 5 ects", trackName: "Information Systems Environment")
           ]
    
    let jobOpportunities: [Career] = [
        // ФИТ
        Career(name: "Software engineer", faculty: .site),
        Career(name: "Web developer", faculty: .site),
        Career(name: "Data scientist", faculty: .site),
        Career(name: "Database administrator", faculty: .site),
        Career(name:  "UX designer", faculty: .site),
        Career(name: "Information security analyst", faculty: .site),
        Career(name: "DevOps engineer", faculty: .site),
        // БШ
        Career(name: "Consultant", faculty: .bs),
        Career(name: "Project Manager", faculty: .bs),
        Career(name: "Analyst", faculty: .bs),
        Career(name: "Financier", faculty: .bs),
        Career(name: "PR Manager", faculty: .bs),
        Career(name: "Risk Manager", faculty: .bs),
        Career(name: "Entrepreneur", faculty: .bs),
        //ФЭНГИ
        Career(name: "Petroleum Engineer", faculty: .sepi),
        Career(name: "Reservoir Engineer", faculty: .sepi),
        Career(name: "Drilling Engineer", faculty: .sepi),
        Career(name: "HSE (Health, Safety, and Environment) Specialist", faculty: .sepi),
        Career(name: "Energy Economist", faculty: .sepi),
        //НОЦМиК
        Career(name: "Data scientist", faculty: .smc),
        Career(name: "Data engineer", faculty: .smc),
        Career(name: "Financial Analyst", faculty: .smc),
        Career(name: "Operations Research Analyst", faculty: .smc),
        Career(name: "Machine Learning Engineer", faculty: .smc),
        Career(name: "Risk Analyst", faculty: .smc),
        //МШЭ
        Career(name: "Data scientist", faculty: .ise),
        Career(name: "Business analyst", faculty: .ise),
        Career(name: "Financial Analyst", faculty: .ise),
        Career(name: "Economist", faculty: .ise),
        Career(name: "Trade Specialist", faculty: .ise),
        Career(name: "Business Consultant", faculty: .ise),
        Career(name: "Market Research Analyst", faculty: .ise),
        Career(name: "Economic Researcher", faculty: .ise),
        Career(name: "Financial Planner", faculty: .ise),
        //КМА
        Career(name: "Marine engineer", faculty: .kma),
        Career(name: "Ship captain", faculty: .kma),
        Career(name: "Port operations manager", faculty: .kma),
        Career(name: "Maritime safety and security officier", faculty: .kma),
        Career(name: "Maritime logistics manager", faculty: .kma),
        //НОЦХИ
        Career(name: "Chemical engineer", faculty: .sce),
        Career(name: "Process engineer", faculty: .sce),
        Career(name: "Quality control engineer", faculty: .sce),
        Career(name: "Energy engineer", faculty: .sce),
        Career(name: "Environmental engineer", faculty: .sce),
        //ФГИГ
        Career(name: "Geologist", faculty: .sge),
        Career(name: "Geological researcher", faculty: .sge),
        Career(name: "Natural resources manager", faculty: .sge),
        Career(name: "Geoscientist", faculty: .sge),
        //НОЦАиЭН
        Career(name: "Sustainability consultant", faculty: .smsgt),
        Career(name: "Green chemist", faculty: .smsgt),
        Career(name: "Biomaterial engineer", faculty: .smsgt),
        Career(name: "Recycling specialist", faculty: .smsgt),
        Career(name: "Sustainable product designer", faculty: .smsgt),
        Career(name: "Environmental analyst", faculty: .smsgt)
    ]
    
    let jobColors = [
    Color("Blue"),
    Color("lightOrange"),
    Color("Green"),
    Color("lightBlue"),
    Color("lightPink"),
    Color("purpleColor")
    ]
 
    
}

