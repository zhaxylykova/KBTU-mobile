//
//  DocumentsView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 25.03.2023.
//

import SwiftUI

//struct Document: Identifiable {
//    let id = UUID()
//    let name: String
//    var children: [Document]? = nil
//}
//
//struct DocumentsView: View {
//    let documents: [Document] = [
//        Document(name: "Document 1", children: [
//            Document(name: "Subdocument 1"),
//            Document(name: "Subdocument 2", children: [
//                Document(name: "Sub-subdocument 1"),
//                Document(name: "Sub-subdocument 2")
//            ])
//        ]),
//        Document(name: "Document 2"),
//        Document(name: "Document 3")
//    ]
//
//    var body: some View {
//        List {
//            OutlineGroup(documents, children: \.children) { document in
//                Text(document.name)
//            }
//        }
//    }
//}

struct Document: Identifiable {
    let id = UUID()
    let name: String
    var children: [Document]? = nil
    var icon: String? = nil
}

struct DocumentsView: View {
    let documents: [Document] = [
        Document(name: "Working curriculum", children: [
            Document(name: "2022-2023",children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2021-2022", children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2020-2021", children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2019-2020", children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2018-2019", children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2017-2018", children: [
                Document(name: "School of Information Technology and Engineering", icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder"),
            Document(name: "2016-2017", children: [
                Document(name: "School of Information Technology and Engineering",  icon: "doc"),
                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
                Document(name: "School of Geology and Exploration", icon: "doc"),
                Document(name: "School of Chemical Engineering", icon: "doc"),
                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
                Document(name: "Business School", icon: "doc"),
                Document(name: "International School of Economics", icon: "doc"),
                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
            ], icon: "folder")
        ], icon: "folder"),
        
        Document(name: "Academic calendar",children: [
            Document(name: "Academic calendar (common)", icon: "doc"),
            Document(name: "Academic calendar for KMA", icon: "doc"),
            Document(name: "Academic calendar for ISE", icon: "doc")
        ], icon: "folder"),
        
        Document(name: "Catalog of elective disciplines", children: [
            Document(name: "School of Information Technology and Engineering", icon: "doc"),
            Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
            Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
            Document(name: "School of Geology and Exploration", icon: "doc"),
            Document(name: "School of Chemical Engineering", icon: "doc"),
            Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
            Document(name: "Business School", icon: "doc"),
            Document(name: "International School of Economics", icon: "doc"),
            Document(name: "Kazakhstan Maritime Academy", icon: "doc")
        ], icon: "folder"),
        
        Document(name: "Main information", children: [
            Document(name: "Bypass sheet", icon: "doc"),
            Document(name: "Rules of credit technology of education", icon: "doc"),
            Document(name: "Instruction for registration", icon: "doc")
        ], icon: "folder")
    ]
    
    var body: some View {
        List {
            OutlineGroup(documents, children: \.children) { document in
                HStack {
                    if let icon = document.icon {
                        Image(systemName: icon)
                    }
                    Text(document.name)
                }
            }
        }
        .navigationTitle("Documents")
        .background(Color("backgroundColor"))
        
    }
    
    private func subdocumentView(_ subdocument: Document) -> some View {
        HStack {
            Image(systemName: "file")
            Text(subdocument.name)
        }
    }
}

struct DocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsView()
    }
}
