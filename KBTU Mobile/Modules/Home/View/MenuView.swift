//
//  MenuView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 03.03.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack (spacing: 20) {

                CellButton(
                    title: "Student Guide",
                    subtitle: "So that you won’t miss anything, buddy :)",
                    color: Color("studentguideColor"),
                    destination: AnyView(StudentGuideView())
                )
                
                HStack (spacing: 20) {
                    CellButton(
                        title: "GPA Calculator",
                        subtitle: "Because you want to save your scholarship, agree?",
                        color: Color("gpaColor"),
                        destination: AnyView(StudentGuideView())
                    )
                    
                    VStack (spacing: 20){
                        CellButton(
                            title: "Online Library",
                            subtitle: "Wow, you can read?",
                            color: Color("libraryColor"),
                            destination: AnyView(OnlineLibraryView())
                        )
                        
                        CellButton(
                            title: "Clubs and Communities",
                            subtitle: "Some sparkle into your boring life",
                            color: Color("clubsColor"),
                            destination: AnyView(ClubsView())
                        )
                    }
                }
                .frame(height: 300)
                
                CellButton(
                    title: "FAQ",
                    subtitle: "Please, learn how to register for classes, you are not 14 years old anymore",
                    color: Color("faqColor"),
                    destination: AnyView(FAQView())
                )
                
                HStack (spacing: 20) {
                    CellButton(
                        title: "Scholarships",
                        subtitle: "Yeeeeeep, easy money!",
                        color: Color("scholarshipsColor"),
                        destination: AnyView(ScholarshipsView())
                    )
                    
                    CellButton(
                        title: "Schools",
                        subtitle: "Maybe you will find out something new",
                        color: Color("schoolsColor"),
                        destination: AnyView(StudentGuideView())
                    )
                }
                .frame(height: 200)
                
                CellButton(
                    title: "Ask the Rector",
                    subtitle: "No jokes, use this opportunity!",
                    color: Color("askrectorColor"),
                    destination: AnyView(AskRectorView())
                )
                
                HStack (spacing: 20) {
                    
                    CellButton(
                        title: "Psychological Consultation",
                        subtitle: "Get some help",
                        color: Color("psychologyColor"),
                        destination: AnyView(PsyConsultationView())
                    )
                    
                    VStack (spacing: 20) {
                        
                        CellButton(
                            title: "Documents",
                            subtitle: "Working curriculum, academic calendar and other",
                            color: Color("testColor"),
                            destination: AnyView(DocumentsView())
                        )
                        
                        CellButton(
                            title: "Academic Mobility",
                            subtitle: "Yeah",
                            color: Color("mobilityColor"),
                            destination: AnyView(MobilityView())
                        )
                        
                    }
                }
                .frame(height: 300)
            }
            .frame(height: 1300)
        }
        .padding()
        .background(Color("backgroundColor"))
        .navigationTitle("Main Menu")
    }
}

struct CellButton: View {
    let title: String
    let subtitle: String
    let color: Color
    let destination: AnyView
    //    let icon: String
    var body: some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .leading, spacing:-20) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding()
                
                Text(subtitle)
                    .multilineTextAlignment(.leading)
                    .opacity(0.7)
                    .font(.subheadline)
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
