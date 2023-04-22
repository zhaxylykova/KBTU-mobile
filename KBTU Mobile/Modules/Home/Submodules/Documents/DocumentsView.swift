//
//  DocumentsView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 25.03.2023.
//

import SwiftUI
import PDFKit

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
    var path: String?
}

struct DocumentsView: View {
    @ObservedObject var viewModel = DocumentsViewModel(
        firebaseStorage: FirebaseStorageService(),
        firestoreService: FirestoreServiceNew()
    )
    
//    let documents: [Document] = [
//        Document(name: "Working curriculum", children: [
//            Document(name: "2022-2023",children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc", path: "sample.pdf"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc", path: "КЭД ФИТ 2020-2021.pdf"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2021-2022", children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2020-2021", children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2019-2020", children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2018-2019", children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2017-2018", children: [
//                Document(name: "School of Information Technology and Engineering", icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder"),
//            Document(name: "2016-2017", children: [
//                Document(name: "School of Information Technology and Engineering",  icon: "doc"),
//                Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//                Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//                Document(name: "School of Geology and Exploration", icon: "doc"),
//                Document(name: "School of Chemical Engineering", icon: "doc"),
//                Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//                Document(name: "Business School", icon: "doc"),
//                Document(name: "International School of Economics", icon: "doc"),
//                Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//            ], icon: "folder")
//        ], icon: "folder"),
//
//        Document(name: "Academic calendar",children: [
//            Document(name: "Academic calendar (common)", icon: "doc"),
//            Document(name: "Academic calendar for KMA", icon: "doc"),
//            Document(name: "Academic calendar for ISE", icon: "doc")
//        ], icon: "folder"),
//
//        Document(name: "Catalog of elective disciplines", children: [
//            Document(name: "School of Information Technology and Engineering", icon: "doc"),
//            Document(name: "School of Energy and Petroleum Industry", icon: "doc"),
//            Document(name: "School of Mathematics and Cybernetics", icon: "doc"),
//            Document(name: "School of Geology and Exploration", icon: "doc"),
//            Document(name: "School of Chemical Engineering", icon: "doc"),
//            Document(name: "School of Materials Science and Green Technologies", icon: "doc"),
//            Document(name: "Business School", icon: "doc"),
//            Document(name: "International School of Economics", icon: "doc"),
//            Document(name: "Kazakhstan Maritime Academy", icon: "doc")
//        ], icon: "folder"),
//
//        Document(name: "Main information", children: [
//            Document(name: "Bypass sheet", icon: "doc"),
//            Document(name: "Rules of credit technology of education", icon: "doc"),
//            Document(name: "Instruction for registration", icon: "doc")
//        ], icon: "folder")
//    ]
    
    var body: some View {
        List {
            if let documents = viewModel.documents {
                OutlineGroup(documents, children: \.children) { document in
                    HStack {
                        if let icon = document.icon {
                            Image(systemName: icon)
                        }
                        if document.icon == "doc" {
                            NavigationLink(destination: PDFViewer(viewModel: viewModel, path: document.path ?? "")) {
                                Text(document.name)
                            }
                        } else {
                            Text(document.name)
                        }
                    }
                }
            }
        }
        .navigationTitle("Documents")
        .background(Color("backgroundColor"))
    }
}

struct DocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsView()
    }
}

struct PDFViewer: View {
    @ObservedObject var viewModel: DocumentsViewModel
    var path: String
    
    var body: some View {
        VStack {
            if let pdfDocument = viewModel.pdfDocument {
                PDFKitView(pdfDocument: pdfDocument)
                    .navigationBarTitle(Text("PDF Viewer"), displayMode: .inline)
            } else if path != "" {
                ProgressView("Loading...")
            } else {
                Text("Empty")
            }
        }
        .onAppear() {
            viewModel.fetchDoc(path: path)
        }
        .onDisappear() {
            viewModel.nilPdfDoc()
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    var pdfDocument: PDFDocument
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDocument
    }
}
