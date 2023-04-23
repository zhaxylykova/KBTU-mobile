//
//  MobilityView.swift
//  KBTU Prototype
//
//  Created by Karina Abubakirova on 25.03.2023.
//

import SwiftUI

struct MobilityView: View {
    
    let items = [
        CarouselItem(image: "mobilityImage1", title: "Student's personal funds"),
        CarouselItem(image: "mobilityImage2", title: "Republican budget funds (MSHE RK)"),
        CarouselItem(image: "mobilityImage3", title: "Erasmus+")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                Text("The possibility of sending students to study at partner universities is carried out at the expense of:")
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.body)
//
//                GeometryReader { geometry in
//                    let size = geometry.size
//                    VStack {
//                        Text("\(size.width)")
//                        Text("\(size.height)")
//                    }
                    CarouselSlider(items: items)
                        .padding(.top, -140)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//                .background(.green)
                //.padding(.horizontal)
            }
            
            //.padding(.top, 20)
        }
        .background(Color("backgroundColor"))
        .navigationTitle("Academic Mobility")
    }
}

struct CarouselItem: Identifiable {
    let id = UUID()
    let image: String
    let title: String
}

struct CarouselSlider: View {
    @State private var currentIndex = 0
    let items: [CarouselItem]
    //let itemSize: CGSize

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
                //.frame(maxWidth: .infinity)
            }
            //.background(.green)
            //.padding()
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
        
        // Add a curve for the rounded bottom
        path.addQuadCurve(to: CGPoint(x: 0, y: height * 0.8), control: CGPoint(x: width * 0.5, y: height))
        
        path.closeSubpath()
        
        return path
    }
}

struct CoatOfArmsCard: View {
    let item: CarouselItem
    
    @State private var isFlipped = false
    //    @ObservedObject var viewModel = MobilityViewModel(firestoreService: FirestoreService<MobilityDataModel>())
    //    @State private var showErrorAlert = false
    //
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
                            Text ("- bachelors of the 2nd and 3rd year of study\n- master students of the 2nd semester of study")
                                .font(.body)
                            Text("when?")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("- bachelor's degree - from the spring semester of the 2nd year\n- master's degree - fall semester of the 2nd year")
                                .font(.body)
                            Text("requirements")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("- GPA at least 2.5\n- English language proficiency level at least B2 (from the transcript) or IELTS 5.5 and above")
                            Text("documents:")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("- full transcript in English\n- scanned copy of the passport\ncertificate of English proficiency if necessary")
                                .font(.body)
                        }
                            .frame(width: 350)
                        //                        if let backofcard = viewModel.backofcard {
                        //                            Text(backofcard.title ?? "")
                        //                                .font(.largeTitle)
                        //                                .foregroundColor(.white)
                        //                                .padding()
                        //                        } else {
                        //                            ProgressView("Loading...")
                        //                        }
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                ShieldShape()
                    .fill(Color("academicmobilityColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                //.shadow(radius: 10)
                    .overlay(
                        VStack(spacing:0) {
                            Text(item.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                            
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350, height: 350)
                        }
                    )
            }
        }
        .padding()
        .frame(width: 400, height: 750)
        //        .onAppear { viewModel.fetchMobility() }
        //        .onChange(of: viewModel.errorMessage) { errorMessage in
        //            if errorMessage != nil {
        //                showErrorAlert = true
        //            }
        //        }
        //        .alert(isPresented: $showErrorAlert) {
        //            Alert(
        //                title: Text("Error fetching data"),
        //                message: Text(viewModel.errorMessage ?? "Unknown error"),
        //                dismissButton: .default(Text("OK"))
        //            )
        //        }
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
