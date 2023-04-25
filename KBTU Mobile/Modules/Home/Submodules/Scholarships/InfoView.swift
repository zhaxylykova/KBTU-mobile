//
//  InfoView.swift
//  kbtu-mob
//
//  Created by Altynay on 28.03.2023.
//

import SwiftUI

struct InfoView: View {
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    var scholarship: ScholarshipDataModel
    
    var body: some View {
        ZStack{
            Color("purpleColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Text(scholarship.title ?? "")
                    .font(.system(size:30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 100, alignment: .center)
                HStack{
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                    Text(scholarship.description ?? "")
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .frame(width: 340)
                }
                Button(action: {isExpanded1.toggle()},
                       label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Условия участия в конкурсе для лиц, поступивших и обучающихся в высших учебных заведениях")
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 410)
                })
                
                if isExpanded1 {
                    VStack {
                        ForEach(scholarship.conditions ?? [], id: \.self) { conditionIndex in
                            HStack {
                                Text(conditionIndex)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 280)
                }
                Spacer()
                
                Button(action: {isExpanded2.toggle()},
                       label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Перечень необходимых документов")
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding()
                })
                
                if isExpanded2 {
                    VStack {
                        ForEach(scholarship.documents ?? [], id: \.self) { documentIndex in
                            HStack {
                                Text(documentIndex)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 280)
                }
                Spacer()
                HStack {
                    Text("С подробностями о конкурсном отборе можно найти на: ")
                        .font(.system(size: 20, weight: .regular))
                    + Text(scholarship.source ?? "")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.blue)
                        .underline()
                }
                .frame(width: 340)
                .onTapGesture {
                    if let url = URL(string: scholarship.source ?? "") {
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(scholarship: ScholarshipDataModel(data: [:]))
    }
}
