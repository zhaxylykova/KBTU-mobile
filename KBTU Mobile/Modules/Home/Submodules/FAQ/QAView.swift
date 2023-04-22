//
//  QAView.swift
//  kbtu-mob
//
//  Created by Altynay on 10.04.2023.
//

import SwiftUI

struct QAView: View {
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    @State private var isExpanded4 = false
   
    
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Text("Study info")
                    .font(.system(size:32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 70, alignment: .center)
                Button(action: {isExpanded1.toggle()},
                       label: {
                    HStack(spacing: 20){
                        Text("How to register for the course?")
                            .frame(width: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "plus")
                    }//hstack closed
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 380)
                    .background(Color("purpleColor"))
                    
                })
                
                if isExpanded1 {
                    Text("1. Go to wsp.kbtu.kz\n2. Enter your credentials\n3. Make sure you don't have any debt. To check that there is no negative balance, click on 'Student financial office' on the main menu\n4. On the main menu click on 'Registration for disciplines'\n5. Select the necessary semester'\n6. Register for the corresponding number of credits of the selected semester\n7. Save selected courses\n8. Confirm the registration\nFor more information, please check the Instruction")
                    .frame(width: 360, height: 360)
                    .font(.system(size: 18, weight: .regular))
                }
                
                Button(action: {isExpanded2.toggle()},
                       label: {
                    HStack(spacing: 20){
                        Text("How many credits do I need to take to complete my degree?")
                            .frame(width: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "plus")
                    }//hstack closed
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 380)
                    .background(Color("purpleColor"))
                    
                })
                
                if isExpanded2 {
                    Text("You have to successfully complete 240 ECTS")
                    .frame(width: 370, height: 50)
                    .font(.system(size: 18, weight: .regular))
                }
                Button(action: {isExpanded3.toggle()},
                       label: {
                    HStack(spacing: 20){
                        Text("When can I add/drop courses?")
                            .frame(width: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "plus")
                    }//hstack closed
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 380)
                    .background(Color("purpleColor"))
                    
                })
                if isExpanded3 {
                    Text("You have to successfully complete 240 ECTS")
                    .frame(width: 370, height: 50)
                    .font(.system(size: 18, weight: .regular))
                }
                Button(action: {isExpanded4.toggle()},
                       label: {
                    HStack(spacing: 20){
                        Text("How to add/drop courses?")
                            .frame(width: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "plus")
                    }//hstack closed
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 380)
                    .background(Color("purpleColor"))
                    
                })
                if isExpanded4 {
                    Text("You have to successfully complete 240 ECTS")
                    .frame(width: 370, height: 50)
                    .font(.system(size: 18, weight: .regular))
                }
                
            } // scroll closed
        }//zstack closed
    }
}

struct QAView_Previews: PreviewProvider {
    static var previews: some View {
        QAView()
    }
}
