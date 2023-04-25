//
//  AskRectorView.swift
//  kbtu-mob
//
//  Created by Altynay on 09.03.2023.
//

import SwiftUI

struct AskRectorView: View {
    @State private var subject = ""
    @State private var typeOfAppeal = "Statement"
    @State private var bodyText = ""
    @State private var showAlert = false
    
    @ObservedObject private var viewModel = AskRectorViewModel()

    private let typesOfAppeal = ["Statement", "Feedback", "Offer"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Ask the Rector")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("In this section you can address your concerns and recommendations to Rector of KBTU. \nThe answer will be sent to your corporate email.")
                .foregroundColor(.black)
                .lineLimit(nil)

            Form {
                Section {
                    TextField("Topic", text: $subject)
                        .font(.title)
                        .padding(.vertical, 8)

                    Picker(selection: $typeOfAppeal, label: Text("Type of Appeal")) {
                        ForEach(typesOfAppeal, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    .frame(width: 300, height: 50)
                    .pickerStyle(SegmentedPickerStyle())
                    .font(.title)
                    .padding(.vertical, 8)
                }

                Section(header: Text("Message")) {
                    TextEditor(text: $bodyText)
                        .font(.title2)
                        .padding(.vertical, 8)
                }
            }
            .listRowBackground(Color.white)
            Button(action: {
                if !subject.isEmpty && !bodyText.isEmpty {
                    viewModel.configureAndSendEmail(subject: subject, typeOfAppeal: typeOfAppeal, body: bodyText)
                } else {
                    showAlert = true
                }
            }) {
                Text("send")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("purpleColor"))
                    .foregroundColor(Color.black)
                    .cornerRadius(40)
            }
        }
        .padding(20)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("backgroundColor"))
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Please fill out all fields"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
struct AskRectorView_Previews: PreviewProvider {
    static var previews: some View {
        AskRectorView()
    }
}
