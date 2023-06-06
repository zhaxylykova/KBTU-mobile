//
//  QAView.swift
//  kbtu-mob
//
//  Created by Altynay on 10.04.2023.
//

import SwiftUI

struct QAView: View {
    @State var item: FAQDataModel
    let defaultModel = [String: String]()
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Text(item.title ?? "")
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 200, alignment: .center)
                
                ForEach(Array(item.values?.keys ?? defaultModel.keys), id: \.self) { key in
                    Button(action: {
                        item.boolDict?[key]?.toggle()
                    },
                           label: {
                        HStack(spacing: 20){
                            Text(key)
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
                    
                    if item.boolDict?[key] ?? false {
                        Text(item.values?[key] ?? "")
                            .multilineTextAlignment(.leading)
                            .frame(width: 360)
                            .font(.system(size: 18, weight: .regular))
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
