//
//  AskRectorView.swift
//  kbtu-mob
//
//  Created by Altynay on 09.03.2023.
//

import SwiftUI

struct AskRectorView: View {
    @State private var topic = ""
    @State private var typeOfAppeal = "Statement"
    @State private var bodyText = ""

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
                    TextField("Topic", text: $topic)
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
            } // form closed
            .listRowBackground(Color.white)
            Button(action: {
                print("Send button tapped")
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
        } //Vstack closed
        .padding(20)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("backgroundColor"))
    }
}
struct AskRectorView_Previews: PreviewProvider {
    static var previews: some View {
        AskRectorView()
    }
}
