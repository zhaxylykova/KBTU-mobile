//
//  FacultyTabView.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 12.06.2023.
//

import SwiftUI

struct TabBarItem: Hashable {
    var id = UUID()
    var name: String
    var view: AnyView

    static func ==(lhs: TabBarItem, rhs: TabBarItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    init<T: View>(name: String, view: T) {
        self.name = name
        self.view = AnyView(view)
    }
}

class ViewModel: ObservableObject {
    @Published var items: [TabBarItem] = [
        TabBarItem(name: "School of Information Technology and Engineering", view: AnyView(FacultyView())),
        TabBarItem(name: "Business School", view: AnyView(School2View())),
        TabBarItem(name: "School of Energy, Oil and Gas Industry", view: AnyView(School3View())),
        TabBarItem(name: "School of Mathematic and Cybernetics", view: AnyView(School4View())),
        TabBarItem(name: "International School of Economics", view: AnyView(School5View())),
        TabBarItem(name: "Kazakhstan Maritime Academy", view: AnyView(School6View())),
        TabBarItem(name: "School of Chemical Engineering", view: AnyView(School7View())),
        TabBarItem(name: "School of Geology and Exploration", view: AnyView(School8View())),
        TabBarItem(name: "School of Materials Science and Green Technologies", view: AnyView(School9View()))
    ]
    @Published var selectedIndex: Int = 0
}

struct TabBarView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        Text(viewModel.items[index].name)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(viewModel.selectedIndex == index ? .white: .black)
                            .frame(width: 170, height: 100)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundColor(viewModel.selectedIndex == index ? Color("darkPurple") : Color("purpleColor")))
                            .onTapGesture {
                                viewModel.selectedIndex = index
                            }
                    }
                }
            }
            .padding()

            viewModel.items[viewModel.selectedIndex].view
        }
        .background(Color("backgroundColor"))
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


