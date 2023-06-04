//
//  InstagramButtonView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 03.06.2023.
//

import SwiftUI

struct InstagramButtonView: View {
        let url: URL?
        
        var body: some View {
            if let url = url {
                Link(destination: url) {
                    Text("our instagram")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(Color("buttonColor"))
                        )
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
            } else {
                ProgressView("Loading...")
            }
        }
    }
