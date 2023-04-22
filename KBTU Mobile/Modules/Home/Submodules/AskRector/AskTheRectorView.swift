//
//  AskTheRectorView.swift
//  kbtu-mob
//
//  Created by Altynay on 14.03.2023.
//

import SwiftUI

struct AskTheRectorView: View {
    @State private var subOfMessage = ""
    @State private var typeAppeal = ""
    @State private var bodyOfMessage = ""
    var body: some View {
        VStack{
            Text("Ask Rector")
            Form {
                TextField("Subject", text: $subOfMessage)
                TextField("Type of appeal", text: $typeAppeal)
                TextField("Some text", text: $bodyOfMessage)
            } // form closed
        } // VStack closed
    }// body closed
}

struct AskTheRectorView_Previews: PreviewProvider {
    static var previews: some View {
        AskTheRectorView()
    }
}
