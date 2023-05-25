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
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            ScrollView {
                Spacer()
                Text("In this section you can address your concerns and recommendations to Rector of KBTU. \nThe answer will be sent to your corporate email.")
                    .foregroundColor(.black)
                    .lineLimit(nil)
                    .frame(width: 340)
                VStack {
                    TextField("Topic", text: $subject)
                        .font(.title2)
                        .frame(height: 30)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(8)
                
                    Picker(selection: $typeOfAppeal, label: Text("Type of Appeal")) {
                        ForEach(typesOfAppeal, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    .frame(width: 300, height: 100)
                    .pickerStyle(.wheel)
                    .font(.title)
                    .padding(.vertical, 8)
                    if bodyText.isEmpty {
                        Text("Enter your message")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 4)
                    }
                    TextEditor(text: $bodyText)
                        .font(.title2)
                        .padding(8)
                        .background(.white)
                        .frame(width: 300, height: 80)
                        .cornerRadius(8)
                }
                .padding(40)
                Button(action: {
                    if !subject.isEmpty && !bodyText.isEmpty {
                        viewModel.configureAndSendEmail(
                            subject: subject,
                            typeOfAppeal: typeOfAppeal,
                            body: bodyText
                        )
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("send")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()
                        .frame(width: 150)
                        .background(Color("purpleColor"))
                        .foregroundColor(Color.black)
                        .cornerRadius(40)
                }
            }
        }
        .navigationTitle("Ask the Rector")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Please fill out all fields"),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                }
            )
        }
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(
                title: Text("Error fetching data"),
                message: Text(""),
                dismissButton: .default(Text("OK")) {
                    viewModel.showErrorMessage = false
                }
            )
        }
        .alert(isPresented: $viewModel.showSuccessMessage) {
            Alert(
                title: Text(""),
                message: Text("You have successfully sent your message"),
                dismissButton: .default(Text("OK")) {
                    viewModel.showSuccessMessage = false
                    subject = ""
                    bodyText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            )
        }
    }
}

struct NewRectorView_Previews: PreviewProvider {
    static var previews: some View {
        AskRectorView()
    }
}
