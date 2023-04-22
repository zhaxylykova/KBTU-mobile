//
//  SettingsView.swift
//  kbtu-mob
//
//  Created by Altynay on 09.03.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack{
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } else {
                        Button("Select an Image"){
                            showingImagePicker = true
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                    ImagePicker(image: $image)
                }
                
            }
        }
    }
    
    func loadImage(){
        guard let selectedImage = image else {return}
        image = selectedImage
    }
}

struct ImagePicker: UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
