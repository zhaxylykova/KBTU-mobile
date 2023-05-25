//
//  MobilityView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 25.03.2023.
//

import SwiftUI

struct MobilityView: View {
    @ObservedObject private var viewModel = MobilityViewModel(firestoreService: FirestoreServiceNew())
    
    var body: some View {
        ScrollView {
            if let items = viewModel.mobilityData {
                VStack(spacing: 0) {
                    Text("The possibility of sending students to study at partner universities for academic mobility depends on the results of the competition for academic mobility, available places at the partner university, and is carried out at the expense of:")
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                        .font(.body)
                    CarouselSlider(items: items)
                        .padding(.top, -140)
                }
            } else {
                ProgressView("Loading...")
            }
        }
        .background(Color("backgroundColor"))
        .navigationTitle("Academic Mobility")
    }
}

struct CarouselSlider: View {
    @State private var currentIndex = 0
    let items: [CarouselItemDataModel]

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            VStack() {
                HStack(spacing: 0) {
                    ForEach(items) { item in
                        CoatOfArmsCard(item: item)
                            .frame(width: size.width)
                    }
                }
                .offset(x: -CGFloat(currentIndex) * geometry.size.width)
                .animation(.spring(), value: currentIndex)
            }
            
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let threshold = geometry.size.width * 0.5
                        let offset = value.translation.width
                        
                        if offset > threshold {
                            currentIndex = max(currentIndex - 1, 0)
                        } else if -offset > threshold {
                            currentIndex = min(currentIndex + 1, items.count - 1)
                        }
                    }
            )
            
            HStack(spacing: 8) {
                ForEach(0..<items.count, id: \.self) { index in
                    Circle()
                    .fill(currentIndex == index ? Color.accentColor : Color.gray)
                    .frame(width: 10, height: 1400)
                    .onTapGesture {
                        withAnimation {
                            currentIndex = index
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .ignoresSafeArea()
    }
}

struct ShieldShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let topHeight = height * 0.2
        
        path.move(to: CGPoint(x: 0, y: topHeight))
        path.addLine(to: CGPoint(x: width, y: topHeight))
        path.addLine(to: CGPoint(x: width, y: height * 0.8))
        
        path.addQuadCurve(to: CGPoint(x: 0, y: height * 0.8), control: CGPoint(x: width * 0.5, y: height))
        
        path.closeSubpath()
        
        return path
    }
}

struct CoatOfArmsCard: View {
    @State private var isFlipped = false
    let item: CarouselItemDataModel
    
    var body: some View {
        VStack {
            if isFlipped {
                ShieldShape()
                    .fill(Color("academicmobilityColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        VStack(spacing:3) {
                            Text("who can apply?")
                                .font(.title3)
                                .fontWeight(.bold)
                            ForEach(item.who ?? [], id: \.self) { item in
                                HStack {
                                    Text(item)
                                        .font(.body)
                                    Spacer()
                                }
                                .frame(width: 350)
                            }
                            Text("when?")
                                .font(.title3)
                                .fontWeight(.bold)
                            ForEach(item.when ?? [], id: \.self) { item in
                                HStack {
                                    Text(item)
                                        .font(.body)
                                    Spacer()
                                }
                                .frame(width: 350)
                            }
                            Text("requirements")
                                .font(.title3)
                                .fontWeight(.bold)
                            ForEach(item.requirements ?? [], id: \.self) { item in
                                HStack {
                                    Text(item)
                                        .font(.body)
                                    Spacer()
                                }
                                .frame(width: 350)
                            }
                            Text("documents:")
                                .font(.title3)
                                .fontWeight(.bold)
                            ForEach(item.documents ?? [], id: \.self) { item in
                                HStack {
                                    Text(item)
                                        .font(.body)
                                    Spacer()
                                }
                                .frame(width: 350)
                            }
                        }
                            .frame(width: 350)
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                ShieldShape()
                    .fill(Color("academicmobilityColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        VStack(spacing:0) {
                            Text(item.title ?? "")
                                .font(.title)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                            
                            Image(item.image ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350, height: 350)
                        }
                    )
            }
        }
        .padding()
        .frame(width: 400, height: 750)
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
    }

}

struct MobilityView_Previews: PreviewProvider {
    static var previews: some View {
        MobilityView()
    }
}
